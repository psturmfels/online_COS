function weighted_sums = single_instance(p_times, weights, release_times, num_algorithms)
weighted_sums = zeros(num_algorithms, 1);

disp('gargmast');
[weighted_sums(1), ~] = online_10(p_times, weights, release_times, 'garg', 'mast');
disp('gargratio');
[weighted_sums(2), ~] = online_10(p_times, weights, release_times, 'garg', 'ratio');
disp('gargtimes');
[weighted_sums(3), ~] = online_10(p_times, weights, release_times, 'garg', 'times');
disp('gargweight');
[weighted_sums(4), ~] = online_10(p_times, weights, release_times, 'garg', 'weight');
disp('mastmast');
[weighted_sums(5), ~] = online_10(p_times, weights, release_times, 'mast', 'mast');
disp('mastratio');
[weighted_sums(6), ~] = online_10(p_times, weights, release_times, 'mast', 'ratio');
disp('masttimes');
[weighted_sums(7), ~] = online_10(p_times, weights, release_times, 'mast', 'times');
disp('mastweight');
[weighted_sums(8), ~] = online_10(p_times, weights, release_times, 'mast', 'weight');

disp('fba_mast');
[weighted_sums(9), ~]  = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'mast');
disp('fba_ratio');
[weighted_sums(10), ~] = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'ratio');
disp('fba_times');
[weighted_sums(11), ~] = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'times');
disp('fba_weight');
[weighted_sums(12), ~] = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'weight');
disp('gargmast');
[weighted_sums(13), ~] = online_10_boost(p_times, weights, release_times, 'garg', 'mast');
disp('gargratio');
[weighted_sums(14), ~] = online_10_boost(p_times, weights, release_times, 'garg', 'ratio');
disp('gargtimes');
[weighted_sums(15), ~] = online_10_boost(p_times, weights, release_times, 'garg', 'times');
disp('gargweight');
[weighted_sums(16), ~] = online_10_boost(p_times, weights, release_times, 'garg', 'weight');
disp('mastmast');
[weighted_sums(17), ~] = online_10_boost(p_times, weights, release_times, 'mast', 'mast');
disp('mastratio');
[weighted_sums(18), ~] = online_10_boost(p_times, weights, release_times, 'mast', 'ratio');
disp('masttimes');
[weighted_sums(19), ~] = online_10_boost(p_times, weights, release_times, 'mast', 'times');
disp('mastweight');
[weighted_sums(20), ~] = online_10_boost(p_times, weights, release_times, 'mast', 'weight');
disp('rtmast');
[weighted_sums(21), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'mast');
disp('rtratio');
[weighted_sums(22), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'ratio');
disp('rttimes');
[weighted_sums(23), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'times');
disp('rtweight');
[weighted_sums(24), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'weight');
disp('greedy');

[weighted_sums(25), ~] = online_greedy(p_times, weights, release_times);
disp('16');
[weighted_sums(26), ~] = online_16(p_times, weights, release_times);

weighted_sums = weighted_sums / weighted_sums(length(weighted_sums));

end
