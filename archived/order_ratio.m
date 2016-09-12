function [permutation] = order_ratio(p_times, weights)
% A heuristic that orders jobs based on weight / (processing time
% on max loaded machine) ratio.

[~, mu] = max(sum(p_times, 2));
ratios = weights ./ p_times(mu, :).';
[~, permutation] = sort(-ratios);
end