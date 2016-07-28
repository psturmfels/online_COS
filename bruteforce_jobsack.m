function [subset, weight] = bruteforce_jobsack(weights, p_times, D)
% A function to solve the "maximum scheduled weight problem"
% in the concurrent open shop setting via bruteforce.
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

subset = [];
weight = 0;
num_jobs = length(weights);

[m, i] = min(max(p_times, [], 1));

% If there exists a job that fits in the interval
if m <= D
    subset = i(1);
    weight = weights(subset);
    
    % Iterate through each subset of the jobs
    for i = 1:num_jobs
        subsets_i = nchoosek(1:num_jobs, i);
        for test_set = subsets_i.'
            % Some optimization possible here: branch and bound 
            % to ignore supersets of invalid or lighter subsets
            
            test_set_size = max(sum(p_times(:, test_set), 2));
            if test_set_size <= D
                test_set_weight = sum(weights(test_set));
                if test_set_weight > weight
                    % Found a new best subset
                    weight = test_set_weight;
                    subset = test_set;
                end
            end
        end
    end
subset = subset.'; 
end