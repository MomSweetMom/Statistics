#### Principels Component Analysis

# Data input
Maths = c(6, 8, 6, 14.5, 14, 11, 5.5, 13, 9)
Phys = c(6, 8, 7, 14.5, 14, 10, 7, 12.5, 9.5)
French = c(5, 8, 11, 15.5, 12, 5.5, 14, 8.5, 12.5)
English = c(5.5, 8, 9.5, 15, 12.5, 7, 11.5, 9.5, 12)
matrix = cbind(Maths, Phys, French, English)
dim(matrix)
rownames(matrix) = c('Maths', 'Physics', 'French', 'English')
matrix
class(matrix)
summary(Maths)
Msd = sd(Maths)


# Using the sd calculated by population 1/n
sd_pop = sqrt(8/9) * sqrt(apply(matrix, 2, var))

View(matrix)
summary(matrix)
max(Maths)

summary = matrix(c(max(Maths), max(Phys), max(French), max(English),
                   min(Maths), min(Phys), min(French), min(English),
                   mean(Maths), mean(Phys), mean(French), mean(English),
                   sd(Maths), sd(Phys), sd(French), sd(English)), ncol = 4)

colnames(summary) = c('Max', 'Min', 'Mean', 'SD_sam')
rownames(summary) = c('Maths', 'Physics', 'French', 'English')

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
P$loadings
P$center  # Empirical mean
P$scale  

P1 = princomp(matrix, cor = T)  # cor = T - Consider cor matrix - normalization
P1$center 
P1$scale  # Standard deviation(1/n)

#### Pre-processing ####
# Centerlize the data
m = matrix(rep(apply(matrix, 2, mean), 9), ncol = 4, byrow = TRUE)
mc = matrix - m
mc
# Other way: transpose matrix 
t(matrix(apply(matrix, 2, mean)) %*% matrix(rep(1, 9), nrow = 1))

test = apply(mc, 2, mean)
test
(test == 0)
(abs(test) < 1^(-15))

#### Normalization ####
norm = matrix(rep(sd_pop, 9), byrow = T, ncol = 4)
mn = mc/norm
P1$loadings
P1$scores
P1$scale
P1
apply(mn, 2, sum)

# Other way: Calculation by using diagonal matrix
D = diag(1/P1$scale)
D
mn = mc %*% D
mn

# Eigenvalues
V = 1/9 * t(mc) %*% mc
R = 1/9 * t(mn) %*% mn
eigen(V)
eigen(R)

# Olympic data
olympic = read.csv("olympic_2.txt", header = T ,sep = "\t"),
View(olympic)

