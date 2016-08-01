function [perm, wcs] = offline_dp(weights, p_times)
% A function that optimally solves an instance of concurrent open shop
% (with objective function as sum of weighted completion times)
% using an exponential dynamic programming algorithm.
% Inputs:
%   p_times = an M x N matrix; ijth entry = processing time of
%             job j on machine i
%   weights = a column vector of length N; jth entry = weight of job j
% Outputs:
%   perm: Optimal permutation of jobs
%   wcs: Sum of weighted completion times of the optimal permutation


num_jobs = length(weights);
indices = 1:num_jobs;

%initialize each size 1 subset
C_prev = zeros(num_jobs, 1);
for h = 1:num_jobs
    C_prev(h) = weights(h) * max(p_times(:, h));
end
prev_perms = (1:num_jobs).';


%Subsets of size t
for t = 2:num_jobs
    C_next = zeros(nchoosek(num_jobs, t) * t,  1);
    next_perms = zeros(nchoosek(num_jobs, t) * t, t);
    i = 1;
    for S = nchoosek(indices, t).'
        for j = S.'
            combination = S(S ~= j);
            prev_bot = comb_order(combination, num_jobs, t - 1);
            prev_bot = prev_bot * (t - 1) - t + 2;
            best_prev_val = C_prev(prev_bot);
            best_prev_index = prev_bot;
            
            for prev_index = (prev_bot + 1):(prev_bot + t - 2)
                if C_prev(prev_index) < best_prev_val
                    best_prev_val = C_prev(prev_index);
                    best_prev_index = prev_index;
                end
            end
            C_next(i) = best_prev_val + max(sum(p_times(:, S), 2)) * weights(j);
            next_perms(i, :) = [prev_perms(best_prev_index, :), j];
            i = i + 1;
        end 
    end
    C_prev = C_next;
    prev_perms = next_perms;
end

[wcs, perm_index] = min(C_prev);
perm = next_perms(perm_index, :);
end

function index = comb_order(combination, n, k)
% Given a k-combination 'combination 'of [n], 
% returns the index of combination within nchoosek(n, k);

index = 1;
j = 0;
for i = 1:k
    j = j + 1;
    while j ~= combination(i)
        index = index + nchoosek(n - j, k - i);
        j = j + 1;
    end
end
end
