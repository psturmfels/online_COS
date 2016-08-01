function [subset] = MUWP_garg(RA_weights, RA_tk, interval_size)
% Solves the Minimum Unscheduled Weight Problem for
% concurrent open shop by using a linear program, and then rounding 
% the values to the nearest integer.

x_bar = MUWP_LP(RA_weights, RA_tk, interval_size);
x_bar_round = floor(x_bar + 0.5001);
subset = (x_bar_round == 1); 
end