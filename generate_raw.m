function generate_raw()
% A function that solves a set number of instances of online 
% concurrent open shop using all combinations of 
% algorithms in this repository.


num_instances = 50;
num_algorithms = 3;
N = 500;        % Number of jobs

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
