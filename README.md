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
The above paper provides an exponential 4-approximation and a polynomial 16-approximation to this problem in section 5.
My lab group and I showed an exponential 3-approximation and a polynomial 10-approximation to the same problem, with a manuscript in-progress. 

All of the online algorithms for this problem rely on a key idea: split time into geometrically increasing intervals. At the beginning of each interval, select from the set of available jobs the subset with the most weight, and schedule that subset in the next interval.
The purpose of this repository is to test different heuristics for the two phases of this algorithm: the _subset_ phase, which chooses the subset, and the _scheduling_ phase, which schedules each subset within an interval. 

### How to use this repo

#### Generating an instance of the problem
The function ``generate_instances`` generates a fixed number of instances of concurrent open shop, with the following paramters:
- num_instances: number of instances
- N: Number of jobs
- M: Number of machines
- max_r: Maximum release time of any job
- max_p: Maximum processing time of any job on any machine
- max_w: Maximum weight of any job

The function generates three groups of instances, each with two conditions. The two conditions are as follows:
Condition p: P = max_p, R = floor(max_r / 5)
Condition r: P = floor(max_p / 5), R = max_r

For all groups, all jobs have release times uniform random on [1, R]. The three groups are as follows:
- sparse: Each job has zero processing time X machines, where X is uniform random on [floor(M / 3), M - 1]. For job j, the machines with zero processing times are sampled uniformly at random from the M machines. For job j, the remaining machines have Y processing time, where Y is uniform random on [1, P]. 
- dense: Each job has processing time on each machine uniform random on [0, P].
- uniform: Each job has zero processing time X machines, where X is uniform random on [1, floor(M / 3)]. For job j, the machines with zero processing times are sampled uniformly at random from the M machines. For job j, the remaining machines have Y processing time, where Y is uniform random on [1, P]. 

#### Solving instances of the problem
In progress. 

#### Comparing Algorithms
In progress.
