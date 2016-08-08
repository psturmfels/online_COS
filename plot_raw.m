function plot_raw()

load psparse_raw.mat
psparse = weighted_sums; 
bar(psparse, 'b');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Sparse, max_p > max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 3]);

load rsparse_raw.mat
rsparse = weighted_sums; 
figure;
bar(rsparse, 'c');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Sparse, max_p < max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 3]);

load pdense_raw.mat
pdense = weighted_sums; 
figure;
bar(pdense, 'r');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Dense, max_p > max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 3]);

load rdense_raw.mat
rdense = weighted_sums; 
figure;
bar(rdense, 'm');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Dense, max_p < max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 3]);

load puniform_raw.mat
puniform = weighted_sums; 
figure;
bar(puniform, 'k');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Uniform, max_p > max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 3]);

load runiform_raw.mat
runiform = weighted_sums; 
figure;
bar(runiform, 'w');
set(gca, 'XTick', 1:26);
set(gca, 'XTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
set(gca, 'XTickLabelRotation', 60);
title('Uniform, max_p < max_r');
xlabel('Algorithm Type');
ylabel('Normalized Sum of Weighted Completion Times');
axis([0 27 0 3]);

%bar3([psparse, rsparse, pdense, rdense, puniform, runiform])
%set(gca, 'YTick', 1:6);
%set(gca, 'XTickLabel', {'psparse', 'rsparse', 'pdense', 'rdense', 'puniform', 'runiform'})
%set(gca, 'YTick', 1:26);
%set(gca, 'YTickLabel', {'10gargmast', '10gargratio', '10gargtimes', '10gargweight', '10mastmast', '10mastratio', '10masttimes', '10mastweight', 'boostfindbestalphamast', 'boostfindbestalpharatio', 'boostfindbestalphatimes', 'boostfindbestalphaweight', 'boostgargmast', 'boostgargratio', 'boostgargtimes', 'boostgargweight', 'boostmastmast', 'boostmastratio', 'boostmasttimes', 'boostmastweight', 'boostrelaxtimemast', 'boostrelaxtimeratio', 'boostrelaxtimetimes', 'boostrelaxtimeweight', 'greedy', 'online16'})
%rotate3d on
end
