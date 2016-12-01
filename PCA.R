#### Principels Component Analysis

# Data input
Maths = c(6, 8, 6, 14.5, 14, 11, 5.5, 13, 9)
Phys = c(6, 8, 7, 14.5, 14, 10, 7, 12.5, 9.5)
French = c(5, 8, 11, 15.5, 12, 5.5, 14, 8.5, 12.5)
English = c(5.5, 8, 9.5, 15, 12.5, 7, 11.5, 9.5, 12)
matrix = cbind(Maths, Phys, French, English)
dim(matrix)
rownames(matrix) = c('Maths', 'Physics', 'French', 'English')
View(matrix)
class(matrix)
summary(Maths)
Msd = sd(Maths)


# Using the sd calculated by population 1/n
View(matrix)
summary(matrix)
max(Maths)

summary = matrix(c(max(Maths), max(Phys), max(French), max(English),
                   min(Maths), min(Phys), min(French), min(English),
                   mean(Maths), mean(Phys), mean(French), mean(English),
                   sd(Maths), sd(Phys), sd(French), sd(English)), ncol = 4)

colnames(summary) = c('Max', 'Min', 'Mean', 'SD_sam')
rownames(summary) = c('Maths', 'Physics', 'French', 'English')

sd_pop = sqrt(8/9) * sqrt(apply(matrix, 2, var))

summary = cbind(summary, sd_pop)
summary
# Correlation table
cor(matrix)
install.packages("corrplot")
library(corrplot) #package corrplot
corrplot(cor(matrix), method = "color") #plot matrix
# Adjust for 1/(n - 1)
X = 8/9 * cov(matrix)
X

# function varn correction for 1/(n-1)
varn <- function(x) {
    varn = (n - 1)/n * var(x)
}

# Consider the covariance matrix
P = princomp(matrix)
P
class(P)
names(P)
P$sdev
P$loadings
P$center  # Empirical mean
P$scale
P$scores

P1 = princomp(matrix, cor = T)  # cor = T - Consider cor matrix - normalization
P1$center 
P1$scale  # Standard deviation(1/n)

#### Pre-processing ####
# Centerlize the data
m = matrix(rep(apply(matrix, 2, mean), 9), ncol = 4, byrow = TRUE)
Xc = matrix - m
Xc
# Other way: transpose matrix 
t(matrix(apply(matrix, 2, mean)) %*% matrix(rep(1, 9), nrow = 1))

test = apply(mc, 2, mean)
test
(test == 0)
(abs(test) < 1^(-15))

#### Normalization ####
norm = matrix(rep(sd_pop, 9), byrow = T, ncol = 4)
Xn = Xc/norm
P1$loadings
P1$scores
P1$scale
P1
apply(mn, 2, sum)

# Other way: Calculation by using diagonal matrix
D = diag(1/P1$scale)
D
Xn = Xc %*% D
Xn

# Eigenvalues
V = 1/9 * t(Xc) %*% Xc  # 8/9 * cov(X)
R = 1/9 * t(Xn) %*% Xn
eigen(V)  # sqrt(eigen(V)) = P$sdev
eigen(R)  # sqrt(eigen(R)) = P$sdev
# Notes: Eigenvalues in decreasing order
#        Each eigenvalue corespond with a vector in column underneath
#        Eigenvalues in pair of orthogonals ones -> independent variables
elva = E1$values
P$loadings # Comp.1 - linear combinations of initial variables
P$scores
summary(P)  # Choosing components: look at cumulative proportion
            # Proportion of Variance: sd^2 (or eigenvalues) / sum of eigenvalues
plot(P)

# Calculate Z1 with Comp.1 & Comp.2
result = c()
f = function(n) {
    for (i in c(1:n)) {
        result = append(result, t(matrix[i, ]) %*% P$loadings[, 1])
        result = append(result, t(matrix[i, ]) %*% P$loadings[, 2])
    }
    return(result)
}
ex = matrix(f(9), byrow = T, ncol = 2)
colnames(ex) = c('Comp.1', 'Comp.2')
plot(ex, type = "p")

library(ggplot2)
ggplot()+geom_text(aes(x=ex[, 1], y=ex[, 2], label=c(1:18)))

P1$loadings

# Projection on Xc
plot(P$scores[, 1],P$scores[, 2], type ="n")
abline(v = 0, h = 0)
text(P$scores[, 1],P$scores[, 2],labels = 1:9)

# Projection on Xn
plot(P1$scores[, 1],P1$scores[, 2], type ="n")
abline(v = 0, h = 0)
text(P1$scores[, 1],P1$scores[, 2],labels = 1:9)

cor(Xc[,1], P$scores)
cor(Xc[,2], P$scores)

cor(Xc, P$scores[,1])
cor(Xc, P$scores[,2])

P2 = princomp(USArrests, cor = T)
biplot(P2)
biplot(P)

# Olympic data
olympic = read.csv("olympic_2.txt", header = T ,sep = "\t")
View(olympic)
m.olympic = as.matrix(olympic)

# Centralized and normalized
centralized = matrix(rep(apply(olympic, 2, mean), 34), ncol = 11, byrow = T)
Oly_centre = olympic - centralized
Oly_centre
normalized = matrix(rep(33 / 34 * apply(Oly_centre, 2, sd), 34), ncol = 11, byrow = T)
Oly_renorm = Oly_centre / normalized
Oly_renorm = as.matrix(Oly_renorm)
class(Oly_renorm)

# Representation of the individuals 
acp_olympic = princomp(Oly_renorm, scores = TRUE)
acp_olympic
correlation = (1/34) * (t(Oly_renorm) %*% Oly_renorm)
covariance = (33/34) * cov(Oly_renorm)
(correlation == covariance)
summary(acp_olympic)
acp_olympic$loadings
acp_olympic$scores
acp_olympic$loadings[, 1]%*%(m.olympic[1, ])

# Represntations of the
cor(Oly_renorm[,1], acp_olympic$scores)
acp_olympic$sdv[1]*acp_olympic$loadings[,1]

# Plot
biplot(acp_olympic)
plot(acp_olympic)

# Heterogeneity in data
I = iris
I = I[, -5]
PCA = princomp(I)
PCA$loadings
V1 = sweep(I, 2, colSums(I), FUN = "-")
V1
V = scale(V1, center=FALSE, scale=apply(V1, 2, sd, na.rm=TRUE))
V = scale(I, center=T, scale=T)
V
eigen(3/4*cov(I))
pairs(I)
