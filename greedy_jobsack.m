function [subset, weight] = greedy_jobsack(weights, p_times, D)
% A function to solve the "maximum scheduled weight problem"
% in the concurrent open shop setting using a greedy algorithm.
% This problem is equivalent to the multi-dimensional knapsack problem.
% The problem is to scheduled the maximum weight subset of jobs that
% completes before time D. 
% Inputs:
%   p_times = an M x N matrix; ijth entry = processing time of
%             job j on machine i
%   weights = a column vector of length N; jth entry = weight of job j
% Outputs:
%   subset: optimal subset of jobs (indices)
%   weight: weight of the optimal subset

J = p_times;
W = weights;

% Initialize:
num_jobs = length(W);
num_machines = size(J, 1);
loads = sum(J, 2);
permutation = zeros(num_jobs, 1).';
indices = 1:num_jobs;

for k = linspace(num_jobs, 1, num_jobs)
    [~, mu] = max(loads);
    mu = mu(1);
    [~, sigma] = min(W ./ J(mu,:).'); 
    sigma = sigma(1);
    theta = W(sigma) / J(mu, sigma);
    W = W - theta * J(mu, :).';
    loads = loads - J(:, sigma);
    
    permutation(k) = indices(sigma);
    
    W(sigma) = [];
    J(:, sigma) = []; 
    indices(sigma) = [];
end

loads = zeros(num_machines, 1);
for break_index = 1:num_jobs;
    loads = loads + p_times(:, permutation(break_index));
    if max(loads) > D
        break
    end
end

subset = permutation(1:(break_index - 1));


max_k_weight = weights(permutation(break_index));
max_k = break_index;
for k = (break_index + 1):num_jobs
    if weights(permutation(k)) > max_k_weight
       max_k = k;
       max_k_weight = weights(permutation(k));
    end
end

subset = [subset, permutation(max_k)];
weight = sum(weights(subset));
end