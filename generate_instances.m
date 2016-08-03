function generate_instances()
% A function that generates a set number of instances of online 
% concurrent open shop from each of 6 specified groups.

num_instances = 2;
N = 10;        % Number of jobs
M = 3;         % Number of machines
max_r = 500;    % Maximum release time
max_p = 500;    % Maximum processing time
max_w = 60;     % Maximum weight

p_times = zeros(M, N, num_instances); 
weights = zeros(N, num_instances);
release_times = zeros(N, num_instances);

%%% Sparse instances
% max_p >> max_r
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_sparse(N, M, max_r / 5, max_p, max_w);
end
save psparse.mat p_times weights release_times;

% max_r >> max_p
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_sparse(N, M, max_r, max_p / 5, max_w);
end
save rsparse.mat p_times weights release_times;


%%% Dense instances
% max_p >> max_r
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_dense(N, M, max_r / 5, max_p, max_w);
end
save pdense.mat p_times weights release_times;

% max_r >> max_p
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_dense(N, M, max_r, max_p / 5, max_w);
end
save rdense.mat p_times weights release_times;


%%% Uniform instances
% max_p >> max_r
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_uniform(N, M, max_r / 5, max_p, max_w);
end
save puniform.mat p_times weights release_times;

% max_r >> max_p
for i = 1:num_instances
    [p_times(:, :, i), weights(:, i), release_times(:,i)] = instance_uniform(N, M, max_r, max_p / 5, max_w);
end
save runiform.mat p_times weights release_times;
end