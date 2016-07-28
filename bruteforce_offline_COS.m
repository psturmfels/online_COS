function [perm, wcs] = bruteforce_offline_COS(weights, p_times)
% A function that optimally solves an instance of concurrent open shop
% (with objective function as sum of weighted completion times)
% by trying all permuations of jobs.
% Inputs:
%   p_times = an M x N matrix; ijth entry = processing time of
%             job j on machine i
%   weights = a column vector of length N; jth entry = weight of job j
% Outputs:
%   perm: Optimal permutation of jobs
%   wcs: Sum of weighted completion times of the optimal permutation

num_jobs = size(p_times, 2); 

%guarenteed to be greater than or equal to the objective function 
wcs = get_weighted_sum(p_times, weights);
perm = (1:num_jobs).';

%iterate over all permutations
for indices = perms(1:num_jobs).'
    current_wcs = get_weighted_sum(p_times(:, indices), weights(indices));
    if current_wcs < wcs
       wcs = current_wcs; 
       perm = indices;
    end
end
perm = perm.';
end

function wcs = get_weighted_sum(p_times, weights)
%A function to compute the objective function's value
%given that the jobs are ordered in the p_time matrix.
wcs = 0;
for i = 1:length(weights)
    wcs = wcs + weights(i) * max(sum(p_times(:, 1:i), 2));
end
end

