function compare_online(num_jobs, num_machines, max_rt, max_p_time, max_weight)
%Define the maximum number of points to plot
max_points = 1000;
x4 = zeros(max_points, 1);
y16 = zeros(max_points, 1);
h = plot(0);
hold on;
set(h, 'Linestyle', 'none', 'Marker', '.');
maxpoint = 0;


for i = 1:max_points
    %Generate a new random instance of concurrent open shop
    [p_times, weights, release_times] = targeted_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight);
    
    %plot the 16-approximation (using LP) on the y-axis
    [y16(i), ~] = online_16apr(p_times, weights, release_times);
    
    %plot the 4-approximation (exponential time) on the x-axis
    [x4(i), ~] = online_4apr(p_times, weights, release_times);
    
    set(h, 'XData', x4, 'YData', y16);
    drawnow;
    
    %Record the maximum point value to draw the x = y line at the end
    if y16(i) > maxpoint
        maxpoint = y16(i);
    end
    if x4(i) > maxpoint
        maxpoint = x4(i);
    end
end
plot([0, maxpoint], [0, maxpoint], [0, maxpoint], [0, maxpoint * 2], [0, maxpoint], [0, maxpoint / 2]);
end
