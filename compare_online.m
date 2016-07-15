function compare_online(num_jobs, num_machines, max_rt, max_p_time, max_weight)
%Define the maximum number of points to plot
max_points = 100;
yg = zeros(max_points, 1);
y4 = zeros(max_points, 1);
y16 = zeros(max_points, 1);
y16g = zeros(max_points, 1);

%hg = plot(0);
%hold on;
%set(hg, 'Linestyle', 'none', 'Marker', '.');

%h4 = plot(0);
%hold on;
%set(h4, 'Linestyle', 'none', 'Marker', '.');

h16 = plot(0);
hold on;
set(h16, 'Linestyle', 'none', 'Marker', '.');

h16g = plot(0);
hold on;
set(h16g, 'Linestyle', 'none', 'Marker', '.'); 

x_vals = 1:max_points;

legend('16apr','16apr+greedy')

%maxpoint = 0;
decrease = zeros(max_points, 1);
for i = x_vals;
    %Generate a new random instance of concurrent open shop
    [p_times, weights, release_times] = targeted_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight + i);
  
%    [yg(i), ~] = greedy_scheduler(p_times, weights, release_times);
%    [y4(i), ~] = apr4(p_times, weights, release_times);
    [y16(i), ~] = apr16(p_times, weights, release_times);
    [y16g(i), ~] = apr16_greedy(p_times, weights, release_times);
    decrease(i) = (100 * (1 - y16g(i) / y16(i)));
%    set(hg, 'XData', x_vals, 'YData', yg);
%    set(h4, 'XData', x_vals, 'YData', y4);
    set(h16, 'xData', x_vals, 'YData', y16);
    set(h16g, 'xData', x_vals, 'YData', y16g);
    drawnow;
   
end
disp(mean(decrease));
%plot([0, maxpoint], [0, maxpoint], [0, maxpoint], [0, maxpoint * 2], [0, maxpoint], [0, maxpoint / 2]);
end
