function [weighted_sum, completion_times] = apr16_alpha(p_times, weights, release_times)

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
        fractional_values = x_bar(0.0001 < x_bar & x_bar < 0.999);
        fractional_values = [fractional_values; 1];
        obj_val = dot(RA_weights, 1 - x_bar);
        max_p_time = max(RA_tk * x_bar);
        
        x_bar_round = floor(x_bar + 0.5001);
        obj_val_ratio = max((dot(RA_weights, 1 - x_bar_round) / obj_val), 1);
        p_time_ratio = max((max(RA_tk * x_bar_round) / max_p_time), 1);
        best_ratio =  obj_val_ratio * p_time_ratio;
        best_alpha = 0.5;

        for alpha = fractional_values.'
            alpha_x_bar_round = floor(x_bar + (1.0001 - alpha));
            
            obj_val_ratio = max(dot(RA_weights, 1 - alpha_x_bar_round) / obj_val, 1);
            p_time_ratio = max(max(RA_tk * alpha_x_bar_round) / max_p_time, 1);
            alpha_ratio = obj_val_ratio * p_time_ratio;
            
            if alpha_ratio < best_ratio;
                best_alpha = alpha;
                best_ratio = alpha_ratio;
            end
        end
        x_bar_round = floor(x_bar + (1.0001 - best_alpha));
        scheduled_indices = indices(x_bar_round == 1);
        
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
    
    k = k + 1;
end
end