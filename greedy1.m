function [weighted_sum, completion_times] = greedy1(p_times, weights, release_times)
%A function that greedily schedules jobs as they come based on
%weight to processing time (on most loaded machine) ratio.
%Assumes jobs are ordered by non-decreasing release-times.

machine_times = zeros(size(p_times, 1), 1) + min(release_times);
weighted_sum = 0;
completion_times = zeros(length(weights), 1) - 1;
i = 1;

while i <= length(release_times)
    
    %Jobs from i to j are the set of jobs to be considered in this
    %iteration.
    j = i;
    while j <= length(release_times) && release_times(j) <= min(machine_times)
        j = j + 1;
    end
    j = j - 1;
    
    %Generate the permutation at which to order the jobs.
    indices = i:j;
    permutation = [];
    while ~isempty(indices)
       %Find the max loaded machine
       [~, max_loaded_machine] = max(sum(p_times(:, indices) , 2));
       
       %Calculate weight / processing time ratio for each job to 
       %be considered on that machine
       ratios = weights(indices) ./ p_times(max_loaded_machine, indices).';
       
       %The worst job is that with the minimum ratio
       worst_job = find(ratios == min(ratios));
       
       %Put it last
       permutation = [indices(worst_job), permutation];
       indices(worst_job) = [];
    end
    
    %Schedule the jobs according to the permutation.
    %Schedule no job before its release_time.
    machine_times = max(machine_times, release_times(i));
    
    for job = permutation
        machine_times = machine_times + p_times(:, job);
        completion_times(job) = max(machine_times);
        weighted_sum = weighted_sum + weights(job) * completion_times(job);
    end
    
    i = j + 1;
end
end