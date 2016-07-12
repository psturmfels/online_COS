function [p_times, weights, release_times] = targeted_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight)
slw_p_times = randi(floor(max_p_time / 4) + 1, num_machines, floor(num_jobs / 4)) - 1;
slw_weights = randi(floor(max_weight / 4), num_jobs, 1);

shw_p_times = randi(floor(max_p_time / 4) + 1, num_machines, floor(num_jobs / 4)) - 1;
shw_weights = randi(max_weight, num_jobs, 1);

llw_p_times = randi(max_p_time + 1, num_machines, floor(num_jobs / 4)) - 1;
llw_weights = randi(floor(max_weight / 4), num_jobs, 1);

lhw_p_times = randi(max_p_time + 1, num_machines, num_jobs - 3 * floor(num_jobs / 4)) - 1;
lhw_weights = randi(max_weight, num_jobs, 1);

release_times = sort(randi(max_rt + 1, num_jobs, 1) - 1);
p_times = [slw_p_times, shw_p_times, llw_p_times, lhw_p_times];
weights = [slw_weights, shw_weights, llw_weights, lhw_weights];
end