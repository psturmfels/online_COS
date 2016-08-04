function generate_raw()
% A function that solves a set number of instances of online 
% concurrent open shop using all combinations of 
% algorithms in this repository.


num_instances = 1;
num_algorithms = 34;
N = 10;        % Number of jobs

weighted_sums = zeros(num_algorithms, num_instances);

% Sparse instances   ------------
load psparse.mat;
fprintf('\npsparse instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save psparse_raw.mat weighted_sums;
clear p_times weights release_times;

load rsparse.mat;
fprintf('\nrsparse instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save rsparse_raw.mat weighted_sums;
clear p_times weights release_times;

% Dense instances    ------------
load pdense.mat;
fprintf('\npdense instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save pdense_raw.mat weighted_sums;
clear p_times weights release_times;

load rdense.mat;
fprintf('\nrdense instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save rdense_raw.mat weighted_sums;
clear p_times weights release_times;

% Uniform instanaces ------------
load puniform.mat;
fprintf('\npuniform instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save puniform_raw.mat weighted_sums;
clear p_times weights release_times;

load runiform.mat;
fprintf('\nruniform instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save runiform_raw.mat weighted_sums;
clear p_times weights release_times;

end

function weighted_sums = single_instance(p_times, weights, release_times, num_algorithms)
weighted_sums = zeros(num_algorithms, 1);

[weighted_sums(1), ~] = online_10(p_times, weights, release_times, 'garg', 'mast');
[weighted_sums(2), ~] = online_10(p_times, weights, release_times, 'garg', 'ratio');
[weighted_sums(3), ~] = online_10(p_times, weights, release_times, 'garg', 'times');
[weighted_sums(4), ~] = online_10(p_times, weights, release_times, 'garg', 'weight');
[weighted_sums(5), ~] = online_10(p_times, weights, release_times, 'mast', 'mast');
[weighted_sums(6), ~] = online_10(p_times, weights, release_times, 'mast', 'ratio');
[weighted_sums(7), ~] = online_10(p_times, weights, release_times, 'mast', 'times');
[weighted_sums(8), ~] = online_10(p_times, weights, release_times, 'mast', 'weight');

[weighted_sums(9), ~] = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'mast');
[weighted_sums(10), ~] = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'ratio');
[weighted_sums(11), ~] = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'times');
[weighted_sums(12), ~] = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'weight');
[weighted_sums(13), ~] = online_10_boost(p_times, weights, release_times, 'garg', 'mast');
[weighted_sums(14), ~] = online_10_boost(p_times, weights, release_times, 'garg', 'ratio');
[weighted_sums(15), ~] = online_10_boost(p_times, weights, release_times, 'garg', 'times');
[weighted_sums(16), ~] = online_10_boost(p_times, weights, release_times, 'garg', 'weight');
[weighted_sums(17), ~] = online_10_boost(p_times, weights, release_times, 'mast', 'mast');
[weighted_sums(18), ~] = online_10_boost(p_times, weights, release_times, 'mast', 'ratio');
[weighted_sums(19), ~] = online_10_boost(p_times, weights, release_times, 'mast', 'times');
[weighted_sums(20), ~] = online_10_boost(p_times, weights, release_times, 'mast', 'weight');
[weighted_sums(17), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'mast');
[weighted_sums(18), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'ratio');
[weighted_sums(19), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'times');
[weighted_sums(20), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'weight');

[weighted_sums(21), ~] = online_greedy(p_times, weights, release_times);
[weighted_sums(22), ~] = online_16(p_times, weights, release_times);

%weighted_sums = weighted_sums / weighted_sums(lemgth(weighted_sums));

end
