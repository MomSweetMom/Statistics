par(family ="serif")

# Load the data set
Budget = read.table("Budget.txt", sep=',')
View(Budget)
dim(Budget)

colnames(Budget) = c("AN", "PVP", "AGR", "CMI", "TRA", "LOG", "EDU", "ACS", "ANC", "DEF", "DET", "DIV")

# examine the structure of the data set.
str(Budget)

rownames(Budget) = Budget$AN
row.names(Budget)
Budget[,-1]


# Remove missing observations
Budget = na.omit(Budget)


# Check the variables names
names(Budget)
boxplot(Budget[,-1])
# Attach the observations Frame
attach(Budget)

#========================
# Univariarte Analysis
#========================
# Here we consider each variable separately.

summary(Budget)

# ------ combine multiple plots into one overall graph -----------
#     Show the distribution as a boxplot 
#     Plot the histogram with, with kernel density estimators. 
#     Make a quantile-quantile plot for both the normal and lognormal distributions.

# 4 figures arranged in 2 rows and 2 columns
par(mfrow=c(2,2))

boxplot(PVP, main = "Boxplot of PVP", horizontal = TRUE, notch = FALSE)
hist(PVP, freq = FALSE, main= "Probability density for PVP")
lines(density(PVP), col="red")
lines(density(PVP, adjust = .5),col="blue") # ‘half the default’ bandwidth
lines(density(PVP, adjust = 2),col="green")

#------QQ Plot
# The graphical functions to visually inspect
# for normality are qqnorm(), qqplot(), and qqline(). 
# qqnorm() plots the sample quantiles against the theoretical quantiles from a normal distribution. 
# qqline() adds a line to the current QQ plot, indicating where
#           the observed values are expected given a normal distribution. 
# qqplot() is used to examine the relationship between two variables.

qqnorm(PVP, main="QQ plot for PVP vs Normal distribution", ylab = "PVP")
qqline(PVP, col= "blue")
qqnorm(log(PVP), main="QQ plot for PVP vs lognormal distribution", ylab = "log(PVP)")
qqline(log(PVP), col = "blue")
par(mfrow=c(1,1)) # reset to 1 plot per figure

#========================
# Bivariarte Analysis
# Bivariarte correlation and regression
#========================
pairs(Budget[,-1])

par(mfrow = c(2,2))
plot(AN, PVP, xlab = "AN", ylab ="PVP", main = "AN vs PVP")
abline (h = mean(PVP), v = mean(AN)) 
plot(PVP, AN, xlab = "PVP", ylab ="AN", main = "PVP vs AN")
abline (v = mean(PVP), h = mean(AN)) 

plot(AGR, PVP, xlab = "AN", ylab ="PVP", main = "AGR vs PVP")
abline (h = mean(PVP), v = mean(AGR)) 
plot(PVP, AGR, xlab = "PVP", ylab ="AGR", main = "PVP vs AGR")
abline (v = mean(PVP), h = mean(AGR))

par(mfrow=c(1,1)) # reset to 1 plot per figure


# The correlation matrix : Identifier rapidement quelques paires de variables fortement corrélées
round(cor(Budget[,-1]),2)


#------------------------------------------
# PRINCIPLE COMPONENT ANALYSIS
# princomp() 	
  # sdev	the standard deviations of the principal components (the square roots of the eigenvalues)
  # loadings	the matrix of variable loadings (columns are eigenvectors)
  # center	the variable means (means that were substracted)
  # scale	the variable standard deviations (the scalings applied to each variable )
  # scores	The coordinates of the individuals (observations) on the principal components.
#------------------------------------------
# Extract individuals and variables for principal component analysis:
Budget1 = Budget[,-1]
head (Budget1)
# Centered normalized PCA
PCA = princomp(Budget1, cor=TRUE) 
# Barplot of the variances explained by the principal components.
plot(PCA)

# Eigenvalues : eigenvalues measures the variability retained by each PC
eigenValues = (PCA$sdev)^2
# Variance in percentage
variance = eigenValues*100/sum(eigenValues)
# Cumulative variances
cumvar = cumsum(variance)

Budget2 = data.frame(eigenValues, variance, cumvar)
Budget2


barplot(variance, main = "Variances",
        xlab = "Principal Components",
        ylab = "Percentage of variances",
        col ="blue")
# Add connected line segments to the plot
lines(x = 1:nrow(Budget2), 
      variance, 
      type="b", pch=19, col = "red")


#----Scree Plot
# A scree plot displays the eigenvalues associated with a component in descending order 
# versus the number of the component. 
# We use scree plots in principal components analysis to visually assess which components 
# explain most of the variability in the data.
screeplot(PCA, type="lines",col=3)
PCA$scores
# plot of first two principal components
plot(PCA$scores[,1],PCA$scores[,2],xlab='comp1', ylab ='Comp2', type='n')
#abline(h = 0, v = 0, lty = 2, col = 8)


# ----------- How to determine the number of components to retain?
# An eigenvalue > 1 indicates that PCs account for more variance than accounted by 
# one of the original variables in standardized data. This is commonly used as a 
# cutoff point for which PCs are retained.

round(eigenValues,2)
# Comp.1  Comp.2  Comp.3  Comp.4  Comp.5  Comp.6  Comp.7  Comp.8  Comp.9 Comp.10 Comp.11 
# 4.97    2.05    1.29    0.99    0.71    0.56    0.20    0.13    0.06    0.04    0.00 


# ----------- Graph of variables : The correlation circle
# names(PCA)
# PCA$loadings
# 
# r = seq (0,2*pi,0.01)
# x= cos(r)
# y=sin(r)
# # Plot the unitary circle
# lines(x,y, col='red')
# biplot(PCA)

