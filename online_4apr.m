function [weighted_sum, completion_times] = online_4apr(p_times, weights, release_times)
k = 0;
weighted_sum = 0;
tk = 0;
tk_plus1 = 0;
completion_times = zeros(length(weights), 1) - 1;

%Indexing vector to keep track of completion times
ctindex = 1:length(weights);

while ~isempty(p_times)
    %Priliminary variables
    interval_size = 2^k;
    tk = tk_plus1;
    tk_plus1 = tk + interval_size;
    
    %the indices of the above jobs in p_times
    indices = 1:length(weights);
    
    %Filter out jobs not yet released
    for i = 1:length(weights)
        if release_times(i) > tk
            indices(i) = -1;
        end
    end
    indices = indices(indices ~= -1);
    
    %The set of jobs to consider in this interval
    RA_tk = p_times(:, indices);
    RA_weights = weights(indices);
    RA_indices = 1:length(RA_weights);
    [m, i] = min(max(RA_tk, [], 1));
    
    if m <= interval_size
        scheduled_indices = i(1);
        best_weight = RA_weights(scheduled_indices);
        
        %Find maximal weight subset of RA_tk
        for i = RA_indices
            subsets_i = nchoosek(RA_indices, i);
            for test_set = subsets_i.'
                test_set_size = max(sum(RA_tk(:, test_set), 2));
                if test_set_size <= interval_size
                    test_set_weight = sum(RA_weights(test_set));
                    if test_set_weight > best_weight
                        best_weight = test_set_weight;
                        scheduled_indices = test_set;
                    end
                end
            end
        end
        
        %Compute the weighted sum of completion times
        for i = 1:length(scheduled_indices)
            ct_i = max(sum(p_times(:, scheduled_indices(1:i)), 2)) + tk;
            completion_times(ctindex(scheduled_indices(i))) = ct_i;
            weighted_sum = weighted_sum + weights(scheduled_indices(i)) * (ct_i);
        end
        
        %Compute necessary length of current interval
        tk_plus1 = max(tk_plus1, tk + max(sum(p_times(:, scheduled_indices), 2)));
        
        %Drop scheduled jobs
        ctindex(scheduled_indices) = [];
        weights(scheduled_indices) = [];
        release_times(scheduled_indices) = [];
        p_times(:, scheduled_indices) = [];
    end
    %Update interval
    k = k + 1;
end
end