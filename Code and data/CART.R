library(rpart)
?rpart

# Note: Depending on the vector (numeric or factor)
#          rpart decides to perform regression or classification

data(mtcars)
View(mtcars)
Y = mtcars$mpg # Response
X = mtcars[, -1] # Predictor
T = rpart(Y~., data=X)
T$frame
# With small amount of minsplit, overfitting is present 
T = rpart(Y~., data=X, control = rpart.control(minsplit = 2, cp = 10^(-15)))
names(T)
A = T[[1]]
A
w=which(A[,1]=='<leaf>')
as.vector(w)
A[,1]
B = A[w,]
B

plot(T)
# Parameters used in CART
T[[8]]
# Importance Variables
T[[12]]
text(T, cex=0.75)
par(mar=c(5.1,4.1,4.1,2.1))
par(mfrow=c(1,1))
par(mfrow=c(2,2))
T
hY = predict(T)
hY
error = 1/nrow(mtcars) * sum((Y-hY)^2)
error
names(T)
summary(T)
T$frame

x = iris[,-5]
y = iris[,5]
Yn = as.numeric(y)
Yn
r = rpart(y~., data=x)
# Note: loss contains number of misclassification
#       (yprob): posterior probability
1/nrow(X)*sum(y!=predict(r,type="class"))

names(r)
rpart(y~., data=x, control = rpart.control(minsplit = 2))

##### Excercises: Create a matrix X where #####
#   - The first column contains 1000 observation Normal(2, sqrt(0.1))
#   - The second column is associated to Exponential(0.2)
#   - The third one is associated to Binomial(5, 0.7)
#   - The variable 4 Normal(-2,0.05)
#   - The variable 5 Binomial(4, 0.2)
#   - The variable 6 N(-1, 0.1)
#   - The variable 7 N(1,0.1)
#   - The variable 8 B(0.5)
#   Y = 2 - 5 * V5 + 4 * V2 if X8 = 0 
#       -3 + 2 * V1 - 7 * V3 if X8 = 1
#       noise e = N(0,1)

V1 = rnorm(mean=2, sd=sqrt(0.1), n=1000)
V2 = rexp(n=1000, rate=0.2)
V3 = rbinom(size=5, prob=0.7, n=1000)
V4 = rnorm(mean=-2, sd =.05, n =1000)
V5 = rbinom(size=4, prob=0.2, n=1000)
V6 = rnorm(mean=-1, sd=sqrt(.1), n=1000)
V7 = rnorm(mean=1, sd=sqrt(.1), n=1000)
V8 = rbinom(size=1,prob=0.5, n=1000)
e = rnorm(mean=0, sd=1, n=1000)
X = cbind(V1, V2, V3, V4, V5, V6, V7, V8)
X = as.data.frame(X)
View(X)

if (X[,8]==0) {
    Y = 2 - 5 * V5 + 4 * V2 + e
} else {
    Y = -3 + 2 * V1 - 7 * V3 +e
}
Y = (2 - 5*V5 + 4*V2 + e) * (X[,8]==0) + (-3 + 2*V1 - 7*V3 + e) * (X[,8]==1)
class(Y)
Y

#   Q1: Run CART algorithm to explain Y thanks to all the variables
#       Look at the variable importance object
R = rpart(Y~., data=X)
R
T = rpart(Y~., data=X, control = rpart.control(minsplit = 2, cp = 10^(-15)))
T$variable.importance
T1 = prune(T, cp = 0.1) 
T1

#   Q2: Create Y1 which is defined by:
#       Y1 = 1 if Y < Q1 (first Quantile of Y)
#       Y1 = 2 if Q1 < Y < Q2
#       Y1 = 3 if Q2 < y < Q3
#       Y1 = 4 if Y > Q4
#       Run the CART algorithm to explain Y1 thanks to X1 & X8
s=summary(Y)
Q1 = s[2]
Q2 = s[3]
Q3 = s[5]
Y1 = 1 * (Y<Q1) + 2 * (Y>Q1)*(Y<Q2) + 3 * (Y>Q2)*(Y<Q3) + 4 * (Y>Q3)
Y1[1:10]
Y1a = as.factor(Y1) # Posterior
Y1a
Ta = rpart(Y1a~., X, control = rpart.control(minsplit = 2, cp = 10^(-15))) 
Ta
error = 1/1000*sum((Y1a!=predict(Ta,type='class')))
error
predict(Ta,type='class')
length(unique(Y))
Ta[[12]]
A = Ta[[1]]
B = A[which(A[,1]=="<leaf>"),]
B
# Deviance = 0 
sum(B[,4])

#   Q3: Repeat Q1 & Q3 but you transform V3 & V5 into quanlitative variables
X[,3] = as.factor(X[,3])
X[,5] = as.factor(X[,5])
str(X)
# Note: when transforming to level, pay attention to label() and levels() 
# in factor to indicate the right order of modality

H = hist(Y1, breaks = c(1,2,3,4))
H
Y2 = rpart(Y1~., X)
Y2
plot(Y2)
text(Y2)

#   Q4: Repeat Q1 with initial variables (no more qualitative variables), but 
#       create 5 bootstrap samples (replace=TRUE)
V3 = rbinom(size=24, prob=0.75, n=1000)
V3 = as.factor(V3)
V3
X$V3 = V3

Y3 = rpart(Y1~., X, control = rpart.control(minsplit = 2, cp = 10^(-15)))
Y3

#### Bootstrap ####
u = 1: 1000
u1 = sample(u, 1000, replace = TRUE)
u2 = sample(u, 1000, replace = TRUE)

X1 = X[u1,]
Y11 = Y1[u1]
T41 = rpart(Y11~., X1)
plot(T41)
v1 = sort(u1)

X2 = X[u2,]
Y12 = Y1[u2]
T42 = rpart(Y12~., X2)
plot(T42)
v2 = sort(u2)

# Check the duplication (>=1) caused by replacement
k=0
for (i in 1:1000) {
    a = v1[i]
    b = (v2 == a)
    if (sum(b)>=1) k=k+1
}
k

# Example
X1 = c(1.2, 1.4, .5, .3)
X2 = c(1, .3, -.2, 0)
X = as.data.frame(cbind(X1, X2))
X
Y = c('a', 'a', 'b', 'b')
Y = as.factor(Y)
class(Y)
rpart(Y~., X, control = rpart.control(minsplit = 2, cp = 10^(-20)))

# Sampling
u = 1:100
sample(u, 50)
sample(u, 101)
sample(u, 101, replace = TRUE)
u1 = sample(u,20,replace = TRUE)
u1
length(unique(u1))

options(digit = 8)
Yi = as.factor(iris[,5])
Xi = iris[,-5]
Ri = rpart(Yi~., Xi, control = rpart.control(minsplit = 2, cp = 10^(-15)))
printcp(Ri)
plotcp(Ri)
par(mfrow = c(1,1))
summary(Ri)
names(Ri)
Ri[[4]]
Ri[[5]]
# Note: error: learning error from training data, 
#              normalized byRoot node error: 100/150 = 0.6666667
#              e.g. for 2nd node (nsplit=1): 50/150 / (100/150)
#       xerror: cross-validation error
#       xstd: std associated to xerror

#### Missing data ####
data("airquality")
View(airquality)
A = airquality
head(A)
dim(A)
s = sum(is.na(airquality))
s
a = is.na(A[,1])
B = which(a=='TRUE')
length(B)
A1 = A[-B,]
dim(A1)
X = A1[,-1]
Y = A1[, 1]
Ozone = rpart(Y~., X, control = rpart.control(minsplit = 2, cp = 10^(-15)))
plot(Ozone)
text(Ozone)
summary(Ozone)
X
which(is.na(X[,1]=='TRUE'))  # Give the number of the line
pY = predict(Ozone)
class(pY)

Ozone = rpart(Y~., X, control = rpart.control(minsplit = 50, cp = 10^(-15)))
plot(Ozone)
text(Ozone)
summary(Ozone)
# Primary Splits: Taking best alternative
# Surrogate splits: Dealing with NA data: Taking the best divisions
#                   (e.g. given the missing data of Temp)
#       - Due to adding prior data


