function [weighted_sum, completion_times] = apr16_greedy(p_times, weights, release_times)

%Preliminary variables
k = 0;
weighted_sum = 0;
tk = 0;
tk_plus1 = 0;
completion_times = zeros(length(weights), 1) - 1;

%Indexing vector to keep track of completion times
ctindex = 1:length(weights);

while ~isempty(p_times)
    %Define the interval
    interval_size = 2^k;
    tk = tk_plus1;
    tk_plus1 = tk + interval_size;
    
    %The indices of the above jobs in p_times
    indices = 1:length(weights);
    
    %Filter out jobs not yet released
    for i = 1:length(weights)
        if release_times(i) > tk
            indices(i) = -1;
        end
    end
    indices = indices(indices ~= -1);
    if ~isempty(indices)
        %The set of jobs to consider in this interval
        RA_tk = p_times(:, indices);
        RA_weights = weights(indices);
        
        %Solve and round the LP
        x_bar = COS_LP(RA_weights, RA_tk, interval_size);
        x_bar_round = floor(x_bar + 0.5001);
        scheduled_indices = indices(x_bar_round == 1);
        
        remaining_indices = scheduled_indices;
        permutation = [];
        while ~isempty(remaining_indices)
            [~, max_loaded_machine] = max(sum(p_times(:, remaining_indices) , 2));
            ratios = weights(remaining_indices) ./ p_times(max_loaded_machine, remaining_indices).';
            worst_job = find(ratios == min(ratios));
            permutation = [remaining_indices(worst_job), permutation];
            remaining_indices(worst_job) = [];
        end
        
        %Compute the weighted sum of completion times
        for i = 1:length(permutation)
            ct_i = max(sum(p_times(:, permutation(1:i)), 2)) + tk;
            completion_times(ctindex(permutation(i))) = ct_i;
            weighted_sum = weighted_sum + weights(permutation(i)) * (ct_i);
        end
        
        %Compute necessary length of current interval
        tk_plus1 = max(tk_plus1, tk + max(sum(p_times(:, scheduled_indices), 2)));
        
        %Drop scheduled jobs
        ctindex(scheduled_indices) = [];
        weights(scheduled_indices) = [];
        release_times(scheduled_indices) = [];
        p_times(:, scheduled_indices) = [];
        
    end
    
    k = k + 1;
end
end