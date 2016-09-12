function [permutation] = order_weight(~, weights)
% A heuristic that orders jobs by non-increasing weight
[~, permutation] = sort(-weights);
end