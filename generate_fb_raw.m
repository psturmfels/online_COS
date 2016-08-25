function generate_fb_raw()
p_times = fscanf(fopen('coflow-benchmark/real_world_cos_from_coflows_p_times.txt'), '%f', [300 526]);
release_times = fscanf(fopen('coflow-benchmark/real_world_cos_from_coflows_r_times.txt'), '%f');
release_times = floor(release_times / 1000);
weights_same = ones(526, 1);
weights_unif = randi(100, 526, 1);
weighted_sum_same = single_instance(p_times, weights_same, release_times, 26);
weighted_sum_unif = single_instance(p_times, weights_unif, release_times, 26);
save facebook_raw.mat weighted_sum_same weighted_sum_unif;
end