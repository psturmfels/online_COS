function [weighted_sum, completion_times] = apr10(p_times, weights, release_times)
% A modification of apr16 that orders the jobs greedily within intervals.


%Preliminary variables
k = 0;
weighted_sum = 0;
completion_times = zeros(length(weights), 1) - 1;

%Indexing vector to keep track of completion times
ctindex = 1:length(weights);

while ~isempty(p_times)
    %Define the interval
    interval_size = 2^k;
    tk = 2^k - 1;
    tk_plus1 = 2^(k + 1) - 1;
    
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
        
        %Choose jobs to schedule in this interval
        subset = MUWP_garg(RA_weights, RA_tk, interval_size);
        scheduled_indices = indices(subset);
        
        %Define the order in which to schedule jobs in the interval
        permutation = order_mast(p_times(:, scheduled_indices), weights(scheduled_indices));
        permutation = scheduled_indices(permutation);
        
        %Compute the weighted sum of completion times
        for i = 1:length(permutation)
            ct_i = max(sum(p_times(:, permutation(1:i)), 2)) + tk_plus1;
            completion_times(ctindex(permutation(i))) = ct_i;
            weighted_sum = weighted_sum + weights(permutation(i)) * (ct_i);
        end
        
        %Drop scheduled jobs
        ctindex(scheduled_indices) = [];
        weights(scheduled_indices) = [];
        release_times(scheduled_indices) = [];
        p_times(:, scheduled_indices) = [];
    end
    
    k = k + 1;
end
end