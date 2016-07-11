function x_bar = COS_LP(weights, p_times, max_processing_time)
options = optimset('Display','none');
lb = zeros(length(weights), 1);
ub = lb + 1;
Aeq = [];
beq = []; 
f = -1 * weights;
b = zeros(num_machines, 1) + max_processing_time;

x_bar = linprog(f, p_times, b, Aeq, beq, lb, ub, [], options);
end
