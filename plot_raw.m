function plot_raw()

load psparse_raw.mat
psparse = weighted_sums; 
figure(1);
bar(psparse, 'b');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Sparse, max_p > max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 2]);
saveas(1, 'Sparse_max_p_>_max_r', 'png');

load rsparse_raw.mat
rsparse = weighted_sums; 
figure(2);
bar(rsparse, 'c');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Sparse, max_p < max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 2]);
saveas(2, 'Sparse_max_p_<_max_r', 'png');


load pdense_raw.mat
pdense = weighted_sums; 
figure(3);
bar(pdense, 'r');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Dense, max_p > max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 2]);
saveas(3, 'Dense_max_p_max_>_r', 'png');

load rdense_raw.mat
rdense = weighted_sums; 
figure(4);
bar(rdense, 'm');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Dense, max_p < max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 2]);
saveas(4, 'Dense_max_p_<_max__r', 'png');

load puniform_raw.mat
puniform = weighted_sums; 
figure(5);
bar(puniform, 'k');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Uniform, max_p > max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 2]);
saveas(5, 'Uniform_max_p_>_max__r', 'png');

load runiform_raw.mat
runiform = weighted_sums; 
figure(6);
bar(runiform, 'w');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Uniform, max_p < max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 2]);
saveas(6, 'Uniform_max_p_<_max__r', 'png');

load facebook_raw.mat
figure(7);
bar(weighted_sum_same);
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Facebook Trace, identical weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 2]);
saveas(7, 'Facebook_Trace_identical_weights', 'png');

figure(8);
bar(weighted_sum_unif);
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Facebook Trace, uniform weights');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 2]);
saveas(8, 'Facebook_Trace_uniform_weights', 'png');

%bar3([psparse, rsparse, pdense, rdense, puniform, runiform])
%set(gca, 'YTick', 1:6);
%set(gca, 'XTickLabel', {'psparse', 'rsparse', 'pdense', 'rdense', 'puniform', 'runiform'})
%set(gca, 'YTick', 1:26);
%set(gca, 'YTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
%rotate3d on
end
