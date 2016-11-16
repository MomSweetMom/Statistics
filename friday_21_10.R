ocdeb = read.table('ocdeb.txt', header = T, sep = "\t")
View(ocdeb)

# read data
A = read.table('extra.txt')

# freg = T: frequencies, only with equal breaks, probability not specified
# freg = F: probability densities, histogram has a total area of one
hist(A[, 1], breaks = 50, freq = F)
x = seq(-3, 7, 0.01)

# simulation
y = dnorm(x, 2, 1)

# add connected line segments to a plot
lines(x, y, col='red')

# variance
var(A[, 1])

# Example on function and for

simuber <- function(n,p) {
    x = c() # empty vector
    for (i in 1:n) {
        u = runif(1)
        if (u<(1-p)) {x=c(x, 0)}
        else {x = c(x, 1)}
    }
    simuber = x
}

for (year in c(2010,2011,2012,2013,2014,2015)){
    print(paste("The year is", year))
}

# The theorem of large number
# Convergence of the expectation
# Simulate 5000 observations from exponential 

set.seed(2016)
X = rexp(5000, 4)
typeof(X)
hist(X)
X[1:10]
X[4]
Y = function(X,m,n) {
    for (i in X[m]:X[n]) {
        mean = sum(i)/(m-n)
    }
    return(mean)
}

cy = c(X[1])
for (i in X[2:5000]){
    cy = c(cy, X[i], cy[i-1])
}
cy
X2 = cy/(1:5000)
X2

palette()
a = rep(palette(),2)
for (i in (1:10)) {
    y=rexp(5000,4)
    y2 = cumsum(y)
    y3 = y2/5000
    
}

# Central limit theorem
# Normal distribution simulation N(2, 3)
TCL = function(n, mean, var, row){
    X = matrix(rnorm(n, mean, var), nrow = row)
    hist(X, breaks = 100)
    sum = 0
    for (k in nrow(X)) {
        estimate = sqrt(ncol(X)) * (sum(X[k, ])/ncol(X) - mean)/sqrt(var)
        sum = sum + estimate
    }
    return(sum/ncol(X))
}
TCL(200000, 2, 3, 10)

# Uniform distribution simulation U(0, 3)
set.seed(1)
# Make many vectors
CLT = function(n, K){
    # for loop on the length of n
    U = matrix(3 * runif(n * K), ncol = n)
    M = apply(U, 1, mean)
    N = (M - 1.5)/sqrt(9/12) * sqrt(n)
    H = hist(N, freq = F)
    limit = H$breaks
    ll = min(limit)
    up = max(limit)
    x = seq(ll, up, 0.01)
    y = dnorm(x)
    lines(x, y, col ='red')
}

CLT(2, 500)
CLT(5, 500)
CLT(200, 5000)

# Exponential
CLT_exp = function(n, K){
    U = matrix(rexp(n * K, 2), ncol = n)
    M = apply(U, 1, mean)
    N = sqrt(n) * (M - 0.5)/sqrt(1/4) 
    H = hist(N, freq = F)
    limit = H$breaks
    ll = min(limit)
    up = max(limit)
    x = seq(ll, up, 0.01)
    y = dnorm(x)
    lines(x, y, col ='red')
}

CLT_exp(1, 1000)
CLT_exp(6, 1000)
CLT_exp(15, 1000)

# With histogram, it is difficult to see all the thing at the same graph
# Using distribution function associated to several values 
# the theoretical limit: (empirical) distribution function
# construct a approximation of P(Xn <= t) for step-up function
TCLexpb = function(vn, K){
    for (j in range(length(vn))){
        n = vn[j]
        U = matrix(rexp(n * K, 5), ncol = n)
        M = apply(U, 1, mean)
        N = sqrt(n) * (M - 0.2)/sqrt(1/15)
        Ns = sort(N)
        plot(Ns, y, type='s', xlim = c(-3, 4), ylim =c(0,1), col=palette()[j])
        x = seq(-3, 4, 0.01)
        y = pnorm(x)
        lines(x, y, col= 'red', lty=2)
        par(new = T)
    }
}  
grphics.off()
TCLexpb(c(1, 3, 5, 20, 30), 1000)

# How to do simulations of un-common distribution
# (1) Based on the distribution function
#     X is a continuous r.v
#     f is a density of X
#     F is a distribution of f of X
#   => Compute inverse F (F_1) (F * F_1 = F_1 * F = x)
#   => Y = F_1(U) with U ~ U[0, 1] has the same distribution than X

# Apply this method to simulate an Exp(X)

# (2) Reject method:
# choose c, count the number of simulation j to get x









