
# coding: utf-8

# In[1]:

# Process the real-world coflow data as an real instance for concurrent open shop
'''
M: number of machines
N: number of jobs
'''
input_filename = 'FB2010-1Hr-150-0.txt'
f = open(input_filename, 'r')
[M, N] = f.readline().split()


# In[2]:

M = int(M)
N = int(N)
p_times = [[0 for x in range(N)] for y in range(2*M)] 
r_times = [0 for x in range(N)] 


# In[3]:

counter = 0
for line in f:
    data_line = line.split()
    r_times[counter] = int(data_line[1])
    
    no_mappers = int(data_line[2])
    mappers = [0 for x in range(no_mappers)] 
    for i in range(no_mappers):
        mappers[i] = int(data_line[3+i])
    
    no_reducers = int(data_line[3+no_mappers])
    reducers = [0 for x in range(no_reducers)]
    shuffle_data = [0 for x in range(no_reducers)]
    for j in range(no_reducers):
        [r, s] = data_line[4+no_mappers+j].split(':')    
        reducers[j] = int(r)
        shuffle_data[j] = float(s)
        
    sum_for_mappers = sum(shuffle_data)
    for m in mappers:
        p_times[m-1][counter] = sum_for_mappers
    
    for i in range(no_reducers):
        p_times[150+reducers[i]-1][counter] = no_mappers*shuffle_data[i]

    counter = counter + 1

f.close()


# In[4]:

output_filename1 = 'real_world_cos_from_coflows_p_times.txt'
w = open(output_filename1, 'w')
for l in p_times:
    for le in l:
        print >>w, le,
    print >>w
w.close()


# In[5]:

output_filename2 = 'real_world_cos_from_coflows_r_times.txt'
w = open(output_filename2, 'w')
for r in r_times:
    print >>w, r
w.close()


# In[ ]:



