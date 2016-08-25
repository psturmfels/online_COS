function [x_bar] = MUWP_LP(weights, p_times, max_processing_time)
% Solve the following linear program: 
%   minimize:   
%       dot(weights, completion_times)
%   subject to:
%       p_times * completion_times <= max_processing_time
%       0 <= completion_times <= 1
% where completion_times and weights are vectors of length N,
% and p_times is an MxN matrix.

options = optimoptions('linprog','Algorithm','dual-simplex', 'Display','none');
lb = zeros(length(weights), 1);
ub = lb + 1;
Aeq = [];
beq = []; 
f = -1 * weights;
num_machines = size(p_times); 
num_machines = num_machines(1);
b = zeros(num_machines, 1) + max_processing_time;

x_bar = linprog(f, p_times, b, Aeq, beq, lb, ub, [], options);
end
