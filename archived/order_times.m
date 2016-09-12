function [permutation] = order_times(p_times, ~)
% A heuristic that orders jobs by non-increasing weight
max_p_times = max(p_times, [], 1).';
[~, permutation] = sort(max_p_times);
end