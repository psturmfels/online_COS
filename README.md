# online_COS
### Various algorithms to solve online concurrent open shop
Concurrent open shop is a problem in scheduling theory, and is as follows. You are given M machines and N jobs. 
Each job j has a non-negative processing time pij on machine i, 1 <= j <= N, 1 <= i <= M. Each job also has a weight wj.
Job j's completion time Cj is defined as the time at which all processing requirements of job j have been met. The objective
is to minimize sum(wj*Cj), the sum of weighted completion times of the jobs. 

There are several variants on the problem. One variant is concurrent open shop with release times: each job also has a non-negative
release time rj. No part of job j can be processed before its release time.

The variant considered here is the online version of concurrent open shop: as opposed to knowing each job in advance, 
jobs arrive over time, and the details of each job become known once they arrive.

The problem is described in [Order Scheduling Models: Hardness and Algorithms](http://www.cse.iitd.ernet.in/~pandit/sched.pdf).
The 4-approximation and the 16-approximation (in online_4apr.m and online_16apr.m respectively) come from section 5 of the above paper.
All other algorithms that appear here are heuristics meant to be tested against algorithms with theoretically-proven performance
guarantees.

### How to use this repo

#### Generating an instance of the problem
The two functions below are provided above and meant to be called as such. Both of them generate instances 
of the online (or offline with release times) concurrent open shop problem. uniform_COS_instance does so uniformly at random,
while targeted_COS_instance generates weights and processing times in a slightly more structured way.

```
[p_times, weights, release_times] = uniform_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight)
[p_times, weights, release_times] = targeted_COS_instance(num_jobs, num_machines, max_rt, max_p_time, max_weight)
```

Inputs: 
- num_jobs: Number of jobs
- num_machines: Number of machines
- max_rt: Maximum release time of any job
- max_p_time: Maximum processing time of any job
- max_weight: Maximum weight of any job
 
Outputs:
- p_times: A num_machines x num_jobs matrix. Each column represents a job, each row represents a machine.
- weights: A vector of length num_jobs, representing the weight of each job.
- release_times: A vector of length num_jobs, representing the release time of each job


#### Solving instances of the problem
The functions below are designed to solve instances of the problem generated from the functions in the above section.
online_16apr and online_4apr are based on the scheduling paper mentioned above.

```
function [weighted_sum, completion_times] = online_16apr(p_times, weights, release_times)
function [weighted_sum, completion_times] = online_4apr(p_times, weights, release_times)
```

Inputs: See outputs of previous section
Outputs: 
- weighted_sum: The value of the objective function, sum of weighted completion times
- completion_times: A vector of length num_jobs, representing the completion time of each job in the schedule

#### Comparing Algorithms
The main point of this repo is not to run algorithms individually, but to compare their results. 
```compare_online(num_jobs, num_machines, max_rt, max_p_time, max_weight)``` is a first stab at 
comparing online_16apr and online_4apr. It generates and solves 1000 instances using both methods. It then
plots the objective funtion's value of online_16apr on the y-axis, and that of online_4apr on the x-axis.
