function [p_times, weights, release_times] = generate_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight)
if nargin < 5
    max_weight = 10;
end
if nargin < 4
    max_p_time = 128;
end
if nargin < 3
   max_rt = 0;
end

weights = randi(max_weight, num_jobs, 1);
release_times = sort(randi(max_rt + 1, num_jobs, 1) - 1); 
%Without loss of generality, sort release times in non-decreasing order

p_times = randi(max_p_time, num_machines, num_jobs);

end