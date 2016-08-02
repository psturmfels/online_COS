function [subset] = MUWP_relaxtime(RA_weights, RA_tk, interval_size)
% Solves the Minimum Unscheduled Weight Problem for
% concurrent open shop by using a linear program, and then rounding 
% fractional values upwards until the objective value is achieved.

x_bar = MUWP_LP(RA_weights, RA_tk, interval_size);
x_bar_round = relax_time(x_bar, RA_weights);
subset = (x_bar_round == 1); 
end

function new_x_vals = relax_time(x_vals, weights)
obj_val_opt = dot(weights, 1 - x_vals);
new_x_vals = x_vals;
if ~isempty(find(x_vals ~= 1, 1))
    new_x_vals = ceil((x_vals) - max(x_vals(x_vals ~= 1)));
end

while true
    max_index = find(x_vals == max(x_vals(x_vals ~= 1)));
    max_index = max_index(1); 
    if (x_vals(max_index) > 0)
        x_vals(max_index) = 0;
        new_x_vals(max_index) = 1;
        obj_val_new = dot(weights, 1 - new_x_vals);
        if (obj_val_opt >= obj_val_new)
            break;
        end
    end
end
end
