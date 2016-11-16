# Consider using different versions of R

pnorm(2.4) - pnorm(2)
pnorm(1) - (1 - pnorm(1))
1 - (1- pnorm(2))

pnorm(2, 2, 4)
pnorm(0)
pnorm(1) - pnorm(0)

runif(10)
# if created with the positive number 
# get the random number followed the default seed
set.seed(3)
runif(10)
set.seed(3)
runif(10)
# using negative number - computer clock
set.seed(-3)
runif(10)
dunif(seq(0, 1, 0.1))
punif(seq(0, 1, 0.1))
qunif(seq(0, 1, 0.1))

# help.start()

# simulate 10 samples of size 100 from B(0.2)
# (a) with the R function => Create a matrix
# (b) with the runif 
rbinom(100, 1, 0.2)
A = matrix(c(rbinom(1000, 1, 0.2)), nrow=10, ncol = 100, byrow = F)
# when extracting, A keeps the same shape
# extract first 10 rows
A[1:10,]
# extract row 1, 3, 4 and the rest of rows
A[c(1, 3, 4),]
# extract column
A[, 90:100]
# concatenation of vectors
c(seq(1, 2, 0.1), seq(7, 5, -0.5))

# delete row 2
A[-2, ]
# delete row 2, 5
E = A[c(-2, -5), ]

l = list(a = seq(1, 10, 0.5))
l
          
p = sample(c("blue", "red", "yellow"), 500, replace = T, prob = c(0.1, 0.7, 0.2))

# factor is a quanlitative value
# should be stored in a list
p2 = factor(p)
p2
# list(p2, 1: 10)

k = matrix(data = 0, nrow = 3, ncol = 2)
k
k[,1] = p2[1:3]
k
k[,2] = 1:3
k

# Using runif
runif(10)

simuber <- function(n,p) {
    x = c() # empty vector
    for (i in 1:n) {
        u = runif(1)
        if (u<(1-p)) {x=c(x, 0)}
        else {x = c(x, 1)}
    }
    simuber = x
}

s = matrix(simuber(1000, 0.2), nrow = 10)
s
# check if the simulation is Bernoulli 
par(mfrow = c(1,1))
barplot(table(s)/1000, ylim = c(0, 1), ylab = "percent")

extra = read.csv('extra.txt')
View(extra)
hist(c(1, 2, 3, 4, 5, 6, 7, 8, 8, 9))

data1 = read.table('data1.txt')
s = table(data1)
pie(s)
is.data.frame(data1)
title('Repartition of colors of eyes')
s/sum(s)


data2 = read.table('data2.txt', sep = "\n")
View(data2)
d2 = factor(data2$V1, levels = c("very bad", "bad", "quite good", "good", "excellent"))
tabled2 = table(d2)/sum(table(d2))
barplot(tabled2, ylim = c(0, 0.6))


data3 = read.table('data3.txt')
unique(data3[,1])
data3 = table(data3)
View(data3)
barplot(data3)
# for discrete variable
# better use of dot lines to manifest the distance between variables
c3 = rep(c(1, 2, 5), 500)
plot(data3/500, type = "p")
plot(data3/500, type = "l")
plot(data3/500, type = "h")

library(Hmisc)
data4 = read.table('data4.txt')
hist(data4[, 1])
H = hist(data4[,1], freq = F, ylim = c(0.0, 3.0))
names(H)
H$counts
H$density
H$breaks
H$mids
H$xname
H$equidist # since all the class has same length
Hl = hist(data4[,1], freq = F, breaks = c(seq(0, 0.6, 0.1), 0.8, 1, 2.2))
names(Hl)
Hl$equidist
mean(data4[,])
1/mean(data4[,1])

# Using ylim to fix the superposition in graphics
plot(1:10, 1:10, type="l")

# Try to superposition the histogram with the exponential function of 
# parameter 4

A = read.table('extra.txt')
dim(A)  
graphics.off()
hist(A[,1], breaks = 25)
hist(A[,1], breaks = 100)
x = seq(-2,6,0.01)
var = var(A[1,])
y = dnorm(x, mean = 2, 1 )
plot(x,y,type ="l")
hist(A[,1], breaks = 150, freq = F)


install.packages("ggplot2")
library(ggplot2)
# list of variables
ls()
# remove
dir()

rm(list=ls())
