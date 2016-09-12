function [subset] = MUWP_mast(RA_weights, RA_tk, interval_size)
% Solves the Minimum Unscheduled Weight Problem for
% concurrent open shop using a combinatorial algorithm
weights = RA_weights;
p_times = RA_tk;

num_jobs = length(weights);
permutation = 1:num_jobs;
indices = 1:num_jobs;
L = sum(p_times, 2);
subset = zeros(num_jobs, 1);

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

L = zeros(size(p_times, 1), 1);
for break_index = 1:(num_jobs)
   L = L + RA_tk(:, permutation(break_index));
   max_load = max(L);
   if max_load > interval_size
      if break_index > 1;
         break_index = break_index - 1; 
      end
      break;
   end
end

if break_index < num_jobs
    [~, add_index] = max(RA_weights(permutation((break_index + 1):num_jobs)));
    add_index = add_index(1) + break_index;
    subset([permutation(1:break_index), permutation(add_index)]) = 1;
else
    subset = ones(num_jobs, 1);
end
end