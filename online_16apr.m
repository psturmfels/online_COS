function weighted_sum = online_16apr(p_times, weights, release_times)
k = 1;
weighted_sum = 0;

while ~isempty(p_times)
    %Priliminary variables
    tk = 2^k - 1;
    tk_plus1 = 2^(k+1) - 1;
    interval_size = tk_plus1 - tk;
    
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
    
    %Solve and round the LP
    x_bar = COS_LP(RA_weights, RA_tk, interval_size);
    x_bar_round = floor(x_bar + 0.5001);
    scheduled_indices = indices(x_bar_round);
    
    %Compute the weighted sum of completion times
    for i = 1:length(scheduled_indices)
        ct_i = max(sum(p_times(:, scheduled_indices(1:i)), 2));
        weighted_sum = weighted_sum + weights(scheduled_indices(i)) * (tk + ct_i);
    end
    
    %Compute necessary length of current interval
    tk_plus1 = max(tk_plus1, tk + max(sum(p_times(:, scheduled_indices), 2)));
    %TODO FOR NEXT TIME: THE INTERVAL SIZES MAY CHANGE BASED ON ROUNDING.
    %FIND OUT HOW LONG THIS INTERVAL SHOULD BE, AND ADJUST NEXT INTERVAL
    %CORRESPONDINGLY
   
    %Drop scheduled jobs
    weights(scheduled_indices) = [];
    release_times(scheduled_indices) = [];
    p_times(:, scheduled_indices) = [];
end


end