function [p_times, weights, release_times] = instance_skewed(num_jobs, num_machines, max_rt, max_p_time, max_weight)
% Generate a COS instance with jobs that have 0 processing time on at 
% least half of the machines

p_times = zeros(num_machines, num_jobs);
for i = 1:size(p_times, 2)
   p_times(randsample(num_machines, floor(num_machines / 2)), i) = randi(max_p_time, floor(num_machines / 2), 1);
end

weights = randi(max_weight, num_jobs, 1);
release_times = sort(randi(max_rt + 1, num_jobs, 1) - 1);
end
