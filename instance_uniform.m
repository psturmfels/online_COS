function [p_times, weights, release_times] = instance_uniform(N, M, max_r, max_p, max_w)
% A function to generate a sparse random instance of concurrent open
% shop; each job has zero processing time on X number of machines,
% where X is random uniform on [1, floor(M / 3)].
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

weights = randi(max_w, N, 1);
release_times = sort(randi(max_r + 1, N, 1) - 1); 
p_times = randi(max_p, M, N);
for job = 1:N
   num_zeros = randi([1, floor(M / 3)]);
   p_times(randsample(N, num_zeros), job) = zeros(num_zeros, 1);
end
end