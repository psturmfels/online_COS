function [subset] = MUWP_mast(RA_weights, RA_tk, interval_size)
% Solves the Minimum Unscheduled Weight Problem for
% concurrent open shop by using a combinatorial algorithm
weights = RA_weights;
p_times = RA_tk;

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

for break_index = 1:(num_jobs - 1)
   max_load = max(sum(RA_tk(:, permutation(1:(break_index + 1))), 2));
   if max_load > interval_size
      break;
   end
end

[~, add_index] = max(RA_weights(permutation((break_index + 1):num_jobs)));
add_index = add_index + break_index;

subset = [permutation(1:break_index), permutation(add_index)];
end