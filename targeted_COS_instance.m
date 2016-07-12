function [p_times, weights, release_times] = targeted_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight)
slw_p_times = randi(floor(max_p_time / 4) + 1, num_machines, floor(num_jobs / 5)) - 1;
slw_weights = randi(floor(max_weight / 3), floor(num_jobs / 5), 1);

shw_p_times = randi(floor(max_p_time / 4) + 1, num_machines, floor(num_jobs / 5)) - 1;
shw_weights = randi(max_weight, floor(num_jobs / 5), 1);

llw_p_times = randi(max_p_time + 1, num_machines, floor(num_jobs / 5)) - 1;
llw_weights = randi(floor(max_weight / 3), floor(num_jobs / 5), 1);

lhw_p_times = randi(max_p_time + 1, num_machines, floor(num_jobs / 5)) - 1;
lhw_weights = randi(max_weight, floor(num_jobs / 5), 1);

skew_p_times = zeros(num_machines, num_jobs - 4 * floor(num_jobs / 5));
for i = 1:size(skew_p_times, 2)
   skew_p_times(randsample(num_machines, floor(num_machines / 2)), i) = randi(max_p_time, floor(num_machines / 2), 1);
end
skew_weights = randi(max_weight, num_jobs - 4 * floor(num_jobs / 5), 1);


release_times = sort(randi(max_rt + 1, num_jobs, 1) - 1);
p_times = [slw_p_times, shw_p_times, llw_p_times, lhw_p_times, skew_p_times];
weights = [slw_weights; shw_weights; llw_weights; lhw_weights; skew_weights];
end