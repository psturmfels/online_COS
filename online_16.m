function [weighted_sum, completion_times] = online_16(p_times, weights, release_times, MUWP)
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
        
        %Choose jobs for this current interval
        switch MUWP
            case 'garg'
                subset = MUWP_garg(RA_weights, RA_tk, interval_size);
            case 'mast'
                subset = MUWP_mast(RA_weights, RA_tk, interval_size);
            case 'find_best_alpha'
                subset = MUWP_find_best_alpha(RA_weights, RA_tk, interval_size);
            case 'relaxtime'
                subset = MUWP_relaxtime(RA_weights, RA_tk, interval_size);
            otherwise
                disp('Invalid MUWP value. Exiting function')
                return
        end
        scheduled_indices = indices(subset);
        
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
    
    k = k + 1;
end
end