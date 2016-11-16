# Note: conventional use of lambda in exponential 
# lambda - French convention
# 1/lambda - English convention
# Poisson process

neuron = read.table('exo1.txt', header = F)
View(neuron)
delay = apply(neuron[, -1] )

# extract the first row: a list of number of event occurence
P = neuron[,1]
P
A = neuron[1, 2:10]

# counting the duplication
table(P)
plot(unique(P), type = 'h')
plot(unique(P), table(P)/length(P), type = 'h')

# sorting P
plot(sort(unique(P)), table(P)/length(P), type = 'h')
title('Number of observations')
M = apply(neuron[, -1], 1, max)
M

# we can choose betwee max(M) or mean(M)
# depending on the situation
hatT = max(M)
hatT
mean(M)

# lambda is a fire-rate
hatlambda = mean(P)/hatT
hatlambda

# estimate the parameter
parameter = hatT * hatlambda
parameter
# create a sequence of integer in [min(P):max(P)]
x= min(P):max(P)
x

y = dpois(x, parameter)
lines(x, y, col='red')

# The delay time between the fire
# conforms to exponential distribution
neuron[1,1]  # for the first row
V1 = neuron[1, 3: 389]
a = V1 - neuron[1, 2: 388]
hist(as.numeric(a), freq = F, breaks = 10)
x = seq(0, max(as.numeric(a)),  0.01)
y = dexp(x, hatlambda)
lines(x, y, col ='red')

neuron[2,1] # for the second row
V1 = neuron[1, 3: 363]
a = V1 - neuron[1, 2: 362]
hist(as.numeric(a), freq = F, breaks = 10)
x = seq(0, max(as.numeric(a)), 0.01)
y = dexp(x, hatlambda)
lines(x, y, col ='red')

# Tests
