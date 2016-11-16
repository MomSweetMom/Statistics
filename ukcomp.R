# Question: R square smaller for 1, 2 variables alone
# Durbin Watson autocorrelation test of residual independence

# Hypothesis Testing
ukcomp = read.table('ukcomp1_r.txt', header = TRUE)
View(ukcomp)
dim(ukcomp)
ls(ukcomp)
pairs(ukcomp)

pairs(~ .,data = ukcomp[2:5])

is.data.frame(ukcomp)
cor(ukcomp)
names(ukcomp)
lm1 = lm(RETCAP ~ ., data = ukcomp)
summary(lm1)

cor.test(ukcomp$RETCAP, ukcomp$LOGSALE, method = 'spearman')

# Test for independence of residuals
# using Durbin Watson test for autocorrelation
library(car)
durbinWatsonTest(lm1, max.lag = 1)



lm2 = lm(RETCAP ~ LOGSALE + CURRAT + NFATAST, data = ukcomp)
summary(lm2)
coefficients(lm2)


prediction = predict(lm1)
prediction
s2 = sum((ukcomp$RETCAP - prediction)^2) / (length(prediction) - 13)
sqrt(s2)

# overview the residual distribution
# epsilon ~ N(0, zigma^2)
op = par(mfrow = c(2, 2))
resid(lm1)
plot(lm1)
op = par(mfrow = c(1, 1))

Y = ukcomp[, 1]
res = Y - prediction
plot(prediction, res)
lines(c(-0.2, 0.4), c(0, 0), col='red')

qqnorm(res)
# Q-Q plot - Quantile - Quantile

# if epsilon ~ the Gaussian distribution
# follow the t test and other Normal distribution test

# comput matrix multiplication A%*%B
