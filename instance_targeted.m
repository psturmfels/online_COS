function [p_times, weights, release_times] = instance_targeted(N, M, max_r, max_p, max_w)
% A function to generate an instance of online concurrent open shop with
% five specific types of jobs.

%short, low-weight jobs
slw_p_times = randi(floor(max_p / 4) + 1, M, floor(N / 5)) - 1;
slw_weights = randi(floor(max_w / 3), floor(N / 5), 1);

%short, high-weight jobs
shw_p_times = randi(floor(max_p / 4) + 1, M, floor(N / 5)) - 1;
shw_weights = randi(max_w, floor(N / 5), 1);

%long, low-weight jobs
llw_p_times = randi(max_p + 1, M, floor(N / 5)) - 1;
llw_weights = randi(floor(max_w / 3), floor(N / 5), 1);

%long, high-weight jobs
lhw_p_times = randi(max_p + 1, M, floor(N / 5)) - 1;
lhw_weights = randi(max_w, floor(N / 5), 1);

%jobs with 0 processing time on at least half of the machines.
skew_p_times = zeros(M, N - 4 * floor(N / 5));
for i = 1:size(skew_p_times, 2)
   skew_p_times(randsample(M, floor(M / 2)), i) = randi(max_p, floor(M / 2), 1);
end
skew_weights = randi(max_w, N - 4 * floor(N / 5), 1);


release_times = sort(randi(max_r + 1, N, 1) - 1);
p_times = [slw_p_times, shw_p_times, llw_p_times, lhw_p_times, skew_p_times];
p_times = p_times(:, randperm(size(p_times, 2)));
weights = [slw_weights; shw_weights; llw_weights; lhw_weights; skew_weights];
weights = weights(randperm(length(weights)));
end