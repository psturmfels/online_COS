function compare_online(num_jobs, num_machines, max_rt, max_p_time, max_weight)
%Define the maximum number of points to plot
max_points = 100;
yg = zeros(max_points, 1);
%y4 = zeros(max_points, 1);
y16 = zeros(max_points, 1);
y16g = zeros(max_points, 1);
%y16a = zeros(max_points, 1);

hg = plot(0);
hold on;
set(hg, 'Linestyle', 'none', 'Marker', '.');

%h4 = plot(0);
%hold on;
%set(h4, 'Linestyle', 'none', 'Marker', '.');

h16 = plot(0);
hold on;
set(h16, 'Linestyle', 'none', 'Marker', '.');

h16g = plot(0);
hold on;
set(h16g, 'Linestyle', 'none', 'Marker', '.'); 

%h16a = plot(0);
%hold on;
%set(h16a, 'Linestyle', 'none', 'Marker', '.'); 

x_vals = 1:max_points;

legend('greedy', '16apr','16apr+greedy') %,'16apr+alpha')

%maxpoint = 0;
for i = x_vals;
    %Generate a new random instance of concurrent open shop
    [p_times, weights, release_times] = targeted_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight + i);
  
    [yg(i), ~] = greedy2(p_times, weights, release_times);
%    [y4(i), ~] = apr4(p_times, weights, release_times);
    [y16(i), ~] = apr16(p_times, weights, release_times);
    [y16g(i), ~] = apr16_greedy(p_times, weights, release_times);
    %[y16a(i), ~] = apr16_alpha(p_times, weights, release_times);
    
    set(hg, 'XData', x_vals, 'YData', yg);
%    set(h4, 'XData', x_vals, 'YData', y4);
    set(h16, 'xData', x_vals, 'YData', y16);
    set(h16g, 'xData', x_vals, 'YData', y16g);
%    set(h16a, 'xData', x_vals, 'YData', y16a);
    drawnow;
   
end
%plot([0, maxpoint], [0, maxpoint], [0, maxpoint], [0, maxpoint * 2], [0, maxpoint], [0, maxpoint / 2]);
end
