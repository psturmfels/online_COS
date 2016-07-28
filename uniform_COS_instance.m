function [p_times, weights, release_times] = uniform_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight)
% A function to generate a uniformly random instance of concurrent open
% shop.

%Generate weights, release times and processing times uniformly on the
%interval. Weights are always non-zero.
weights = randi(max_weight, num_jobs, 1);

%Without loss of generality, sort release times in non-decreasing order
release_times = sort(randi(max_rt + 1, num_jobs, 1) - 1); 
p_times = randi(max_p_time + 1, num_machines, num_jobs) - 1;

end