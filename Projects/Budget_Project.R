#### Packages ####
library(reshape2)
library(magrittr)
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
Budget <- read.csv("~/Downloads/Budget.txt", header=FALSE, stringsAsFactors=FALSE)
View(Budget)
par(family ="sans-serif")
dim(Budget)
colnames(Budget) = c("AN", "PVP", "AGR", "CMI", "TRA", "LOG", "EDU", "ACS", "ANC", "DEF", "DET", "DIV")
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
                       decreasing = T) )
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
