# ANOVA - Analysis of Variance
# Linear regression can be performed with quantitative data,
# but not useful towards quanlitative data

ali = factor(rep(c("t1", "t2", "t3"), each = 5))

# Remark: the sample size is small, 
# the null hypothesis is hard to reject
gain = c(37.7, 44.6, 42.1, 45.1, 43.2, 45.2, 54.2, 38.1, 
         48.3, 55.1, 48.3, 44.1, 56.9, 42.2, 54)
length(gain)
boxplot(gain ~ ali)
data = data.frame(ali, gain)
View(data)
tapply(gain, ali, mean)
hist(gain, freq = FALSE)

# the mean between groups are close
# there is no significant different with small amount of data
mu = mean(gain)
sigma = sqrt(var(gain))
pp = function(x)
pp = pnorm(x, mu, sigma)

# One-sample Kolmogorov-Smirnov test
# Check the Normal distribution
# This method is influenced by the size due to the test is an asymtotic one
ks.test(gain, pp)
ks.test(gain, pnorm)
lm = lm(gain ~ ali)
anova(lm)
# all coefficients = 0

xfac = factor(rep(1: 4, each = 3))
yfac = gl(3, 1, 12)

obs = c(0, 1, 2, 3, 1, 2, 5, 4, 3, 4, 4, 1)

length(obs)
# column depends on yfac
coplot(obs ~ xfac|yfac, show.given = F, col = 3, rows = 1, type = 'b')
obs
xfac
yfac

# simpliest form of linear regression
# look at the graph and see the effect of each factor on dependent variable
lm1 = lm(obs ~ 1)
summary(lm1)
mean(obs)

lm2 = lm(obs ~ xfac)
lm2
coplot(predict(lm2) ~ xfac|yfac, show.given = F, col = 3, rows =1, type ='b')

# yfac still have some effect but small - look at the scale
lm3 = lm(obs ~ yfac)
lm3
coplot(predict(lm3) ~ xfac|yfac, show.given = F, col = 3, rows =1, type ='b')
       
lm4 = lm(obs ~ xfac + yfac)
lm4
coplot(predict(lm4) ~ xfac|yfac, show.given = F, col = 3, rows =1, type ='b')

anova(lm3)
anova(lm4)

lm5 = lm(obs ~ yfac + xfac)
lm5
coplot(predict(lm5) ~ xfac|yfac, show.given = F, col = 3, rows =1, type ='b')

anova(lm5)

lm6 = lm(obs ~ xfac + yfac + xfac * yfac)
lm6
coplot(predict(lm6) ~ xfac|yfac, show.given = F, col = 3, rows =1, type ='b')

anova(lm6)

library(MASS)
View(npk)
attach(npk)
npk.aov = aov(yield ~ block + N * P * K, npk)
summary(npk.aov)
names(npk.aov)
coefficients((npk.aov))

sum((mean(obs) - predict(lm2))^2)
sum((mean(obs) - predict(lm3))^2)

