function [weighted_sum, completion_times] = greedy2(p_times, weights, release_times)
%A function that greedily schedules jobs as they come based on
%weight to processing time (on most loaded machine) ratio.
%Assumes jobs are ordered by non-decreasing release-times.

machine_times = zeros(size(p_times, 1), 1) + min(release_times);
weighted_sum = 0;
completion_times = zeros(length(weights), 1) - 1;
i = 1;
ctindex = 1:length(completion_times);

while ~isempty(p_times)
    %Define the current time
    current_time = max(min(machine_times), min(release_times));
    machine_times = max(machine_times, current_time);
    
    indices = release_times <= current_time;
    
    %Find the "max_loaded_machine"
    [~, max_loaded_machine] = max(sum(p_times(:, indices) , 2));
    
    ratios = weights(indices) ./ p_times(max_loaded_machine, indices).';
    to_schedule = find(ratios == max(ratios));
    to_schedule = to_schedule(1);
    
    machine_times = machine_times + p_times(:, to_schedule);
    completion_times(ctindex(to_schedule)) = max(machine_times);
    weighted_sum = weighted_sum + max(machine_times) * weights(to_schedule);

    p_times(:, to_schedule) = [];
    weights(to_schedule) = [];
    ctindex(to_schedule) = [];
    release_times(to_schedule) = [];
end
end