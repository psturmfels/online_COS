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

[weighted_sums(9), ~]  = online_10_boost(p_times, weights, release_times, 'find_best_alpha', 'mast');
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
[weighted_sums(21), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'mast');
[weighted_sums(22), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'ratio');
[weighted_sums(23), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'times');
[weighted_sums(24), ~] = online_10_boost(p_times, weights, release_times, 'relaxtime', 'weight');

[weighted_sums(25), ~] = online_greedy(p_times, weights, release_times);
[weighted_sums(26), ~] = online_16(p_times, weights, release_times);

weighted_sums = weighted_sums / weighted_sums(length(weighted_sums));

end
