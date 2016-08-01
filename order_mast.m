function [permutation] = order_mast(p_times, weights)
% Given a set of jobs with weights, returns a permutation 
% of jobs that results in a 2-approximation for weighted
% completion time (Mastrolilli et al.)

num_jobs = length(weights);
permutation = 1:num_jobs;
indices = 1:num_jobs;
L = sum(p_times, 2);

for k = linspace(num_jobs, 1, num_jobs)
    %Determine machine of max load
    [~, mu] = max(L);
    mu = mu(1);
    
    %Determine worst job
    ratios = weights ./ p_times(mu, :).';
    [~, sigma] = min(ratios); 
    sigma = sigma(1);
    
    %Adjust weights
    theta = weights(sigma) / p_times(mu, sigma);
    weights = weights - theta * p_times(mu, :).';
    L = L - p_times(:, sigma);
    
    %Set this job as the next-to-last job
    permutation(k) = indices(sigma);
    
    %Update unscheduled jobs
    weights(sigma) = [];
    p_times(:, sigma) = [];
    indices(sigma) = [];
end
end
