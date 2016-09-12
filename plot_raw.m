function plot_raw()

num_algorithms = 3;

%%%% Sparse instances
%%% max_p >> max_r
% identical weights
load p_i_sparse.mat
psparse = weighted_sums; 
figure(1);
bar(psparse, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Sparse, max_p > max_r, identical weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'p_i_sparse', 'png');

% random weights
load p_r_sparse.mat
psparse = weighted_sums; 
figure(1);
bar(psparse, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Sparse, max_p > max_r, random weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'p_r_sparse', 'png');

%%% max_r >> max_p
% identical weights
load r_i_sparse.mat
psparse = weighted_sums; 
figure(1);
bar(psparse, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Sparse, max_r > max_p, identical weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'r_i_sparse', 'png');

% random weights
load r_r_sparse.mat
psparse = weighted_sums; 
figure(1);
bar(psparse, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Sparse, max_r > max_p, random weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'r_r_sparse', 'png');

%%%% Dense instances
%%% max_p >> max_r
% identical weights
load p_i_dense.mat
figure(1);
bar(weighted_sums, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Dense, max_p > max_r, identical weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'p_i_dense', 'png');
 
% random weights
load p_r_dense.mat
figure(1);
bar(weighted_sums, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Dense, max_p > max_r, random weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'p_r_dense', 'png');
 
%%% max_r >> max_p
% identical weights
load r_i_dense.mat
figure(1);
bar(weighted_sums, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Dense, max_r > max_p, identical weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'r_i_dense', 'png');
 
% random weights
load r_r_dense.mat
figure(1);
bar(weighted_sums, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Dense, max_r > max_p, random weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'r_r_dense', 'png');

%%%% Uniform instances
%%% max_p >> max_r
% identical weights
load p_i_uniform.mat
figure(1);
bar(weighted_sums, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Uniform, max_p > max_r, identical weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'p_i_uniform', 'png');
 
% random weights
load p_r_uniform.mat
figure(1);
bar(weighted_sums, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Uniform, max_p > max_r, random weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'p_r_uniform', 'png');
 
%%% max_r >> max_p
% identical weights
load r_i_uniform.mat
figure(1);
bar(weighted_sums, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Uniform, max_r > max_p, identical weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'r_i_uniform', 'png');
 
% random weights
load r_r_uniform.mat
figure(1);
bar(weighted_sums, 'b');
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Uniform, max_r > max_p, random weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(1, 'r_r_uniform', 'png');

%%%% Facebook data
% identical weights
load facebook_raw.mat
figure(7);
bar(weighted_sum_same);
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Facebook Trace, identical weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(7, 'Facebook_Trace_identical_weights', 'png');

%random weights
figure(8);
bar(weighted_sum_unif);
set(gca, 'XTick', 1:num_algorithms);
set(gca, 'XTickLabel', {'10gargmast', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Facebook Trace, uniform weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 num_algorithms 0 2]);
saveas(8, 'Facebook_Trace_random_weights', 'png');

end
