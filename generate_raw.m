function generate_raw()
% A function that solves a set number of instances of online 
% concurrent open shop using all combinations of 
% algorithms in this repository.


num_instances = 1;
num_algorithms = 34;
N = 10;        % Number of jobs

weighted_sums = zeros(num_algorithms, num_instances);
completion_times = zeros(N, num_algorithms, num_instances);

% Sparse instances   ------------
load psparse.mat;
fprintf('\npsparse instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   [weighted_sums(:, j), completion_times(:, :, j)] = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms, N);
end
save psparse_raw.mat weighted_sums completion_times;
clear p_times weights release_times;

load rsparse.mat;
fprintf('\nrsparse instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   [weighted_sums(:, j), completion_times(:, :, j)] = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms, N);
end
save rsparse_raw.mat weighted_sums completion_times;
clear p_times weights release_times;

% Dense instances    ------------
load pdense.mat;
fprintf('\npdense instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   [weighted_sums(:, j), completion_times(:, :, j)] = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms, N);
end
save pdense_raw.mat weighted_sums completion_times;
clear p_times weights release_times;

load rdense.mat;
fprintf('\nrdense instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   [weighted_sums(:, j), completion_times(:, :, j)] = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms, N);
end
save rdense_raw.mat weighted_sums completion_times;
clear p_times weights release_times;

% Uniform instanaces ------------
load puniform.mat;
fprintf('\npuniform instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   [weighted_sums(:, j), completion_times(:, :, j)] = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms, N);
end
save puniform_raw.mat weighted_sums completion_times;
clear p_times weights release_times;

load runiform.mat;
fprintf('\nruniform instances: ');
for j = 1:num_instances
    fprintf('%d ', j);
   [weighted_sums(:, j), completion_times(:, :, j)] = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms, N);
end
save runiform_raw.mat weighted_sums completion_times;
clear p_times weights release_times;

end

function [weighted_sums, completion_times] = single_instance(p_times, weights, release_times, num_algorithms, N)
weighted_sums = zeros(num_algorithms, 1);
completion_times = zeros(N, num_algorithms, 1);
a = 1;

MUWPS = char('find_best_alpha', 'garg', 'mast', 'relaxtime');
orders = char('mast', 'ratio', 'times', 'weight');


for MUWP = MUWPS.'
    for order = orders.'
           %fprintf('%s, %s\n', MUWP.', order.')
           [weighted_sums(a), completion_times(:, a)] = online_10(p_times, weights, release_times, strtrim(MUWP.'), strtrim(order.'));
           a = a + 1;
           [weighted_sums(a), completion_times(:, a)] = online_10_boost(p_times, weights, release_times, strtrim(MUWP.'), strtrim(order.'));
           a = a + 1;
    end
end
[weighted_sums(a), completion_times(:, a)] = online_greedy(p_times, weights, release_times);
a = a + 1;
[weighted_sums(a), completion_times(:, a)] = online_16(p_times, weights, release_times);
end
