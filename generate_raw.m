function generate_raw()
% A function that solves a set number of instances of online 
% concurrent open shop using all combinations of 
% algorithms in this repository.


num_instances = 50;
num_algorithms = 3;
N = 500;        % Number of jobs

weighted_sums = zeros(num_algorithms, num_instances);

%%%% Sparse instances   ------------
%%% max_p >> max_r
% identical weights
load p_i_sparse_raw.mat;
fprintf('\np_i_sparse instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save p_i_sparse.mat weighted_sums;
clear p_times weights release_times;

% random weights
load p_r_sparse_raw.mat;
fprintf('\np_r_sparse instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save p_r_sparse.mat weighted_sums;
clear p_times weights release_times;

%%% max_r >> max_r
% identical weights
load r_i_sparse_raw.mat;
fprintf('\nr_i_sparse instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save r_i_sparse.mat weighted_sums;
clear p_times weights release_times;

% random weights
load r_r_sparse_raw.mat;
fprintf('\nr_r_sparse instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save r_r_sparse.mat weighted_sums;
clear p_times weights release_times;

%%%% Dense instances   ------------
%%% max_p >> max_r
% identical weights
load p_i_dense_raw.mat;
fprintf('\np_i_dense instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save p_i_dense.mat weighted_sums;
clear p_times weights release_times;
 
% random weights
load p_r_dense_raw.mat;
fprintf('\np_r_dense instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save p_r_dense.mat weighted_sums;
clear p_times weights release_times;
 
%%% max_r >> max_r
% identical weights
load r_i_dense_raw.mat;
fprintf('\nr_i_dense instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save r_i_dense.mat weighted_sums;
clear p_times weights release_times;
 
% random weights
load r_r_dense_raw.mat;
fprintf('\nr_r_dense instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save r_r_dense.mat weighted_sums;
clear p_times weights release_times;

%%%% Uniform instances   ------------
%%% max_p >> max_r
% identical weights
load p_i_uniform_raw.mat;
fprintf('\np_i_uniform instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save p_i_uniform.mat weighted_sums;
clear p_times weights release_times;
 
% random weights
load p_r_uniform_raw.mat;
fprintf('\np_r_uniform instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save p_r_uniform.mat weighted_sums;
clear p_times weights release_times;
 
%%% max_r >> max_r
% identical weights
load r_i_uniform_raw.mat;
fprintf('\nr_i_uniform instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save r_i_uniform.mat weighted_sums;
clear p_times weights release_times;
 
% random weights
load r_r_uniform_raw.mat;
fprintf('\nr_r_uniform instances: ');
for j = 1:num_instances
   fprintf('%d ', j);
   weighted_sums(:, j) = single_instance(p_times(:,:,j), weights(:, j), release_times(:, j), num_algorithms);
end
weighted_sums = mean(weighted_sums, 2);
save r_r_uniform.mat weighted_sums;
clear p_times weights release_times;

end
