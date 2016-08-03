function [p_times, weights, release_times] = instance_dense(num_jobs, num_machines, max_rt, max_p_time, max_weight)
% A function to generate a sparse random instance of concurrent open
% shop; each job has zero processing time on X number of machines,
% where X is random uniform on [floor(M / 3), M - 1].
%
% inputs:
%   N = number of jobs
%   M = number of machines
%   max_r = maximum release time of any job
%   max_p = maximum processing time of any job on a machine
%   max_w = maximum weight of a job
%
% outputs:
%   p_times = an M x N matrix; ijth entry is job j's time on machine i  
%   weights = a length-N vector of job weights
%   release_times = a length-N vector of job release times


%Generate weights, release times and processing times uniformly on the
%interval. Weights are always non-zero.
weights = randi(max_weight, num_jobs, 1);

%Without loss of generality, sort release times in non-decreasing order
release_times = sort(randi(max_rt + 1, num_jobs, 1) - 1); 
p_times = randi(max_p_time + 1, num_machines, num_jobs) - 1;

end