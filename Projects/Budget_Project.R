#### Packages ####
install.packages("reshap2")
library(reshape2)
install.packages("magrittr")
library(magrittr)  # Package for pipeline %>%
install.packages("ggplot2")
library(ggplot2)
install.packages("devtools")
install.packages("Rcpp")
library(devtools)
library(Rcpp)
install_github('ramnathv/rCharts')
library(rCharts)
install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

#### Load the data set ####
Budget <- read.csv("Budget.txt", header=FALSE, stringsAsFactors=FALSE)
View(Budget)
par(family ="sans-serif")
dim(Budget)
colnames(Budget) = c("AN", "PVP", "AGR", "CMI", "TRA", "LOG", 
                     "EDU", "ACS", "ANC", "DEF", "DET", "DIV")
# rownames(Budget) = Budget$AN


# Examine the structure of the data set.
str(Budget)
dim(Budget)
rownames(Budget) = Budget$AN
row.names(Budget)
Budget[,-1]

# Remove missing observations if any
Budget = na.omit(Budget)

# Check the variables names
names(Budget)
par(mfrow=c(1,1))
boxplot(Budget[,-1])
# Attach the observations Frame
attach(Budget)


#===========================#
#### Univariate Analysis ####
#===========================#
# Here we consider each variable separately.

summary(Budget)
summary(lm(AN~.,Budget))
# ------ Combine multiple plots into one overall graph -----------
#     Data overview    
#     Show the distribution as a boxplot 
#     Plot the histogram with, with kernel density estimators. 
#     Make a quantile-quantile plot for both the normal and lognormal distributions.

#### INTERACTIVE DATA OVERVIEW ####
View(Budget)
long_data <- Budget %>% gather(Type, Allocation, -AN)
View(long_data)
n <- nPlot(Allocation ~ AN, data = long_data, 
           group = "Type", type = "lineChart")
n$chart(yDomain = sort(range(long_data$Allocation), 
                       decreasing = F) )
n$chart(interpolate = "step-after")
n$xAxis(axisLabel = "Year")
n$yAxis(axisLabel = "Allocation")
n$chart(margin = list(left = 75))
n

# Histogram graphic of each variable
par(mfrow=c(3,4))
for (i in 2:length(names(Budget))){
  hist(scale(Budget)[,i],main=names(Budget)[i])
  lines(density(Budget[,i]), col="red")
  lines(density(Budget[,i], adjust = .5),col="blue") # ‘half the default’ bandwidth
  lines(density(Budget[,i], adjust = 2),col="green")
}

# Histogram graphic of
par(mfrow=c(3,4),family ='sans')
for (i in 2:length(names(Budget))){
  hist((Budget)[,i],main=names(Budget)[i],prob=TRUE,xlab='% of the total Budget')
  lines(density(Budget[,i]), col="red")
  # lines(density(Budget[,i], adjust = .5),col="blue") # ‘half the default’ bandwidth
  #lines(density(Budget[,i], adjust = 2),col="green")
}

# Check normalization
c_d<-names(Budget)
for (i in 2:length(names(Budget))){
  qqnorm((Budget)[,i], main=paste(c_d[i],'\n', 'vs','\n', 'Normal dist.'), ylab = c_d[i])
  qqline((Budget)[,i], col= "green")
}

#### HEATMAP ####
cormat<-round(cor(Budget),2)
#cormat<-get_upper_tri(cormat)
cormat<-melt(cormat)

ggplot(data=data.frame(cormat),
       aes(fill=value,x=X1, y=X2)) +
       geom_tile(color="white") +
       scale_fill_gradient2(low = "blue", 
                            high = "blue", 
                            mid = "orange", 
                            midpoint = 0, 
                            limit = c(-1,1), 
                            space = "Lab",
                            name="Pearson\nCorrelation")

# minimal theme 

#Budget

#### Time Series Analysis ####
Budget[,2]
par(mfrow = c(3,4))
for (i in 2:(ncol(Budget))) {
    tb = ts(Budget[,i])
    plot(tb)
}
res = PCA(Budget, quanti.sup= c(11:12), qualif.sup = c(13))
res






N<-matrix(rep(apply(Budget[,-1],2,sd),24), nrow=24)
N<- (24-1)/23*(1/N)
M<-matrix(rep(apply(Budget[,-1],2,mean),24),nrow=24)
Mprime<-Budget[,-1]-M

M_n<-Mprime*N
my_H_clust<-hclust(dist(M_n),method ="ward.D2")
plot(my_H_clust)
plot(my_H_clust$height)
lines(my_H_clust$height, col='green')


lo <-smooth.spline(my_H_clust$height, spar=0.5)
le<-smooth.spline(my_H_clust$height, spar=0.5)
plot(my_H_clust$height)
lines(predict(lo, deriv=1), col='red')
lines(predict(le), col='blue')


X11()
x<-c(1,20)
y<-c(13,9)
#plot(x,y)
#lines(x,y, col=2)

my_h <-rev(my_H_clust$height)
my_h<-round(my_h,2)
plot(my_h, type='n')
#text(my_h,labels= my_h)
lines(my_h, col='green')
lines(x=c(48.11,36.24,24,12,0),col='red')
text(my_h,labels=my_h,cex=0.5)

lines(x,y, col=2)

library(factominR)



Lambda_r<-(P$sdev)^2/sum((P$sdev)^2)

plot(Lambda_r, col='green')
lines(Lambda_r, col='pink')
Lambda_r<-cumsum(Lambda_r)
plot(Lambda_r)
lines(Lambda_r,col='pink')
abline(h = 0.9,col='black')
abline(h = 0.8,col='red')

message("3 values have been replaced")







# Note: Upward trend in EDU (Education)  & ACS (Social Action) overtime

#### K-Means ####
km=kmeans(Budget[,-1],3,nstart=50)
Budget[,-1]
km$cluster
plot(Budget[,-1], col=(km$cluster+1), 
     main="K-Means Clustering Results with K=3", 
     pch=20, cex=2)