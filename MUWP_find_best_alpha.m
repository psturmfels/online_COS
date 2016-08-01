function [subset] = MUWP_find_best_alpha(RA_weights, RA_tk, interval_size)
[x_bar] = MUWP_LP(RA_weights, RA_tk, interval_size);
[~, ind] = sort(-x_bar);
[~, ~, subset, ~, ~, ~] = find_best_step(x_bar, RA_weights, RA_tk, ind, interval_size);
end