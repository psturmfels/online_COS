function generate_instances()
% A function that generates a set number of instances of online 
% concurrent open shop from each of 6 specified groups.

num_instances = 50;
N = 500;        % Number of jobs
M = 50;         % Number of machines
max_r = 2000;    % Maximum release time
max_p = 2000;    % Maximum processing time
max_w = 100;     % Maximum weight

p_times = zeros(M, N, num_instances); 
weights = zeros(N, num_instances);
release_times = zeros(N, num_instances);

%%%% Sparse instances
%%% max_p >> max_r
% identical weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_sparse(N, M, max_r / 5, max_p, 1);
end
save p_i_sparse.mat p_times weights release_times;

% random weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_sparse(N, M, max_r / 5, max_p, max_w);
end
save p_r_sparse.mat p_times weights release_times;

%%% max_r >> max_p
% identical weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_sparse(N, M, max_r, max_p / 5, 1);
end
save r_i_sparse.mat p_times weights release_times;

% random weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_sparse(N, M, max_r, max_p / 5, max_w);
end
save r_r_sparse.mat p_times weights release_times

%%%% Dense instances
%%% max_p >> max_r
% identical weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_dense(N, M, max_r / 5, max_p, 1);
end
save p_i_dense.mat p_times weights release_times;
 
% random weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_dense(N, M, max_r / 5, max_p, max_w);
end
save p_r_dense.mat p_times weights release_times;
 
%%% max_r >> max_p
% identical weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_dense(N, M, max_r, max_p / 5, 1);
end
save r_i_dense.mat p_times weights release_times;
 
% random weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_dense(N, M, max_r, max_p / 5, max_w);
end
save r_r_dense.mat p_times weights release_times

%%%% uniform instances
%%% max_p >> max_r
% identical weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_uniform(N, M, max_r / 5, max_p, 1);
end
save p_i_uniform.mat p_times weights release_times;
 
% random weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_uniform(N, M, max_r / 5, max_p, max_w);
end
save p_r_uniform.mat p_times weights release_times;
 
%%% max_r >> max_p
% identical weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_uniform(N, M, max_r, max_p / 5, 1);
end
save r_i_uniform.mat p_times weights release_times;
 
% random weights
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_uniform(N, M, max_r, max_p / 5, max_w);
end
save r_r_uniform.mat p_times weights release_times

end