function [weighted_sum, completion_times] = online_10_boost(p_times, weights, release_times, MUWP, order)
% A modification of online_16 that orders the jobs within each interval
% using an offline 2-approximation algorithm by Mastrolilli et al.
% This ordering results in a provably better bound.
% Furthermore, each interval is only extended as much as necessary,
% jobs are scheduled immediately in the next interval.

%Preliminary variables
k = 0;
tk_plus1 = 0;
weighted_sum = 0;
completion_times = zeros(length(weights), 1) - 1;

%Indexing vector to keep track of completion times
ctindex = 1:length(weights);

while ~isempty(p_times)
    %Define the interval
    tk = max(tk_plus1, min(release_times));
    interval_size = 2^k;
    tk_plus1 = tk + interval_size;
    
    %Filter out jobs not yet released
    indices = find(release_times <= tk);
    
    if ~isempty(indices)
        %The set of jobs to consider in this interval
        RA_tk = p_times(:, indices);
        RA_weights = weights(indices);
        
        %Choose jobs to schedule in this interval
        subset = -1;
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
                fprintf('Invalid MUWP value "%s". Exiting function\n', MUWP);
                return
        end
        scheduled_indices = indices(subset == 1);
        
        if ~isempty(scheduled_indices)
            %Define the order in which to schedule jobs in the interval
            permutation = -1;
            switch order
                case 'mast'
                    permutation = order_mast(p_times(:, scheduled_indices), weights(scheduled_indices));
                case 'ratio'
                    permutation = order_ratio(p_times(:, scheduled_indices), weights(scheduled_indices));
                case 'times'
                    permutation = order_times(p_times(:, scheduled_indices), weights(scheduled_indices));
                case 'weight'
                    permutation = order_weight(p_times(:, scheduled_indices), weights(scheduled_indices));
                otherwise
                    fprintf('Invalid order value "%s". Exiting function\n', order);
                    return;
            end
            permutation = scheduled_indices(permutation);
            
            %Compute the weighted sum of completion times
            for i = 1:length(permutation)
                ct_i = max(sum(p_times(:, permutation(1:i)), 2)) + tk;
                completion_times(ctindex(permutation(i))) = ct_i;
                weighted_sum = weighted_sum + weights(permutation(i)) * (ct_i);
            end
            
            %Calculate the end of this interval
            tk_plus1 = max(sum(p_times(:, permutation), 2)) + tk;
            
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