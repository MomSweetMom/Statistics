#### Inverse Transform Method ####

simuexp <- function(n, lambda) {
    # simulation of n observations of a uniform on [0, 1]
    u = runif(n)
    simuep = -1/lambda * log(u)
}

# 5000 observations of an exponential of parameter 2
a = simuexp(5000, 2)
a
hist(a)
hist(a, freq = F, breaks = 30)
# check the distribution function
x = seq(0, 4, 0.01)
y = dexp(x, 2)
lines(x, y, col='red')

x = seq(-10, 10, 0.01)
y1 = dnorm(x)
y2 = 1/2 * exp(-abs(x)) * sqrt(2 * exp(1)/pi)
plot(x, y1, col='blue', xlim = c(-7, 7), ylim = c(0, 0.7), type = 'l')
# keep the previous screen
par(new = T)
plot(x, y2, col='red', xlim = c(-7, 7), ylim = c(0, 0.7), type = 'l')

lines(y1, y2, col='red')

# simulation of laplace
simlapla <- function(n) {
    # transform binorm in [0, 1] -> [-1, 1]
    epxilon = 2 * rbinom(n, 1, 0.5) - 1
    z = rexp(n, 1)
    simulapla <- epxilon * z
}

a = simlapla(5000)
hist(a, fred = F)
hist(a, freq = F, breaks = c(seq(-10, -0.5, 0.5), seq(-0.5, 0.5, 0.15),
     seq(0.5, 10, 0.5)), ylim = c(0, 0.5), xlim = c(-10, 10))
x = seq(-15, 15, 0.01)
y = 1/2 * exp(-abs(x))
lines(x, y, col='red')

rejectnrow <- function(n,c){
    i = 0
    # keep the vector when make a loop on the length of n vector
    a = c()
    while (length(a)<n) {
        i = i + 1
        z = simlapla(1)
        u = runif(1)
        f = dnorm(z)
        g = 1/2 * exp(-abs(z))
        if (u*c*g <f) {
            a = c(a,z)
        }
    }
    rejectnrow <- list(simulatedvalues=a, totalnumberofsimulations=i)
}

zz <- simlapla(5)
zz
t10 = rejectnrow(10, sqrt(2 * exp(1)/pi))
t10
t5000 = rejectnrow(5000, sqrt(2 * exp(1)/pi))
t5000[[2]]

# double check by simulation 
graphics.off()
hist(t5000[[1]])
w = seq(-5, 5, 0.01)
lines(w, dnorm(w), col='red')


# values of c
c = sqrt(2 * exp(1)/pi)
c  # 1.3154

# increase c
t2 = rejectnrow(5000, 2)
t2[[2]]
t3 = rejectnrow(5000, 5)
t3[[2]]

# Quantiles
y = rep( c(1, 3, 4, 5), 100)
y
boxplot(y)
glength(y)
f = levels(y)
boxplot(y ~ f)
f = factor(rep(1: 4, 100))
f
boxplot(y ~ f)

ocdeb = read.table('ocdeb.txt', header = T, sep = "\t")
View(ocdeb)
is.data.frame(ocdeb)
str(ocdeb)
summary(ocdeb)

a = runif(10)
max(a)
a = runif(1000)
max(a)
2 * mean(a)

library(stats)
x = seq(0, 70, 0.01)
hist(dchisq(x, 2), freq = F)
plot(x, dchisq(x, 3), type ='l')

M = matrix(rnorm(1000 * 10000, 2, 0.1), ncol = 10000)
me = apply(M, 1, mean)
me
alpha = 0.05
# compute the quantile (1 - alpha/2)
t2 = qnorm(0.975)
t2

limits = matrix(data = 0, ncol = 2, nrow = 1000)
limits[, 1] = me - 0.1/sqrt(10000) * t2
limits[, 2] = me + 0.1/sqrt(10000) * t2

# a vector of size 1000 of the mean 2
u = rep(2, 1000)

# t = 1 falls within the confidence interval
t = (u>=limits[, 1]) * (u<=limits[, 2])
t
sum(t/1000)

# asymtotic confidence interval
# uniform?

