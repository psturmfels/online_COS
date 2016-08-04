function [weighted_sum, completion_times] = online_16(p_times, weights, release_times)
% An implementation of the polynomial-time 16-approximation algorithm
% to the online concurrent open shop problem. The algorithm is
% described in Order Scheduling Models: Hardness and Algorithms
% by Garg et al.

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
    
    %Filter out jobs not yet released
    indices = find(release_times <= tk);
    for i = 1:length(indices)
        max_l = max(p_times(:, indices(i)));
        if max_l > interval_size
           indices(i) = -1; 
        end
    end
    indices(indices == -1) = [];
    
    if ~isempty(indices)
        %The set of jobs to consider in this interval
        RA_tk = p_times(:, indices);
        RA_weights = weights(indices);
        
        %Choose jobs for this current interval
        subset = MUWP_garg(RA_weights, RA_tk, interval_size);
        scheduled_indices = indices(subset == 1);
        
        if ~isempty(scheduled_indices)
            %Compute the weighted sum of completion times
            for i = 1:length(scheduled_indices)
                ct_i = max(sum(p_times(:, scheduled_indices(1:i)), 2)) + tk_plus1;
                completion_times(ctindex(scheduled_indices(i))) = ct_i;
                weighted_sum = weighted_sum + weights(scheduled_indices(i)) * (ct_i);
            end
            
            %Drop scheduled jobs
            ctindex(scheduled_indices) = [];
            weights(scheduled_indices) = [];
            release_times(scheduled_indices) = [];
            p_times(:, scheduled_indices) = [];
        end
    end
    
    k = k + 1;
end
end