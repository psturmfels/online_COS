function [obj_val_round, mp_time_round, new_x_vals, temp_p_ratios, temp_w_ratios, round_ratios] = find_best_step(x_bar, weights, p_times, ind, max_processing_time)
    new_weights = weights(ind);
    new_p_times = p_times(:, ind);
    obj_val_lin = get_obj_val(x_bar, weights);
    len = max(size(x_bar));
    temp_p_ratios = zeros(1, len);
    temp_w_ratios = zeros(1, len);
    for k=1:len
        temp_p_ratios(k) = max(sum(new_p_times(:, 1:k), 2));
        temp_w_ratios(k) = sum(new_weights(k+1:end));
    end
    p_ratios = max((temp_p_ratios/max_processing_time), 1);
    w_ratios = max((temp_w_ratios/obj_val_lin), 1);
    round_ratios = p_ratios.*w_ratios;
    [best_r, pos] = min(round_ratios);
    obj_val_round = temp_w_ratios(pos);
    mp_time_round = temp_p_ratios(pos);
    new_x_vals = zeros(1, len);

    new_x_vals(ind(1:pos)) = 1;

end
