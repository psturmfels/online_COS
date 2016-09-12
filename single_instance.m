function weighted_sums = single_instance(p_times, weights, release_times, num_algorithms)
weighted_sums = zeros(num_algorithms, 1);

disp('gargmast');
[weighted_sums(1), ~] = online_10(p_times, weights, release_times, 'garg', 'mast');

disp('greedy');
[weighted_sums(2), ~] = online_greedy(p_times, weights, release_times);
disp('16');
[weighted_sums(3), ~] = online_16(p_times, weights, release_times);

weighted_sums = weighted_sums / weighted_sums(length(weighted_sums));

end
