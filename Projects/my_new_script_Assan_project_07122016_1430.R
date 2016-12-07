

# Load the data set
Budget <- read.csv("~/Downloads/Budget.txt", header=FALSE, stringsAsFactors=FALSE)
View(Budget)
par(family ="sans-serif")
dim(Budget)
colnames(Budget) = c("AN", "PVP", "AGR", "CMI", "TRA", "LOG", "EDU", "ACS", "ANC", "DEF", "DET", "DIV")
#rownames(Budget) = Budget$AN


# examine the structure of the data set.
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

#========================
# Univariate Analysis
#========================
# Here we consider each variable separately.

summary(Budget)

# ------ combine multiple plots into one overall graph -----------
#     Show the distribution as a boxplot 
#     Plot the histogram with, with kernel density estimators. 
#     Make a quantile-quantile plot for both the normal and lognormal distributions.

plot_plus<-function(a_var){
  # 4 figures arranged in 2 rows and 2 columns
  par(mfrow=c(1,2))
  boxplot(a_var, main = ("Boxplot"), horizontal = TRUE, notch = FALSE)
  #lines(density(a_var), col="red")
  #lines(density(a_var, adjust = .5),col="blue") # ‘half the default’ bandwidth
  #lines(density(a_var, adjust = 2),col="green")
}
boxplot("Budget")

par(mfrow=c(3,4))
for (i in 2:length(names(Budget))){
  hist(scale(Budget)[,i],main=names(Budget)[i])
  lines(density(Budget[,i]), col="red")
  lines(density(Budget[,i], adjust = .5),col="blue") # ‘half the default’ bandwidth
  lines(density(Budget[,i], adjust = 2),col="green")
}

par(mfrow=c(3,4),family ='sans')
for (i in 2:length(names(Budget))){
  hist((Budget)[,i],main=names(Budget)[i],prob=TRUE,xlab='% of the total Budget')
  lines(density(Budget[,i]), col="red")
  # lines(density(Budget[,i], adjust = .5),col="blue") # ‘half the default’ bandwidth
  #lines(density(Budget[,i], adjust = 2),col="green")
}


par(mfrow=c(3,4))

c_d<-names(Budget)

for (i in 2:length(names(Budget))){
  qqnorm((Budget)[,i], main=paste(c_d[i],'\n', 'vs','\n', 'Normal dist.'), ylab = c_d[i])
  qqline((Budget)[,i], col= "green")
}



# HEATMAP
cormat<-round(cor(Budget),2)
#cormat<-get_upper_tri(cormat)
cormat<-melt(cormat)

ggplot(data=data.frame(cormat),aes(fill=value,x=X1, y=X2))+geom_tile(color="white")+
  scale_fill_gradient2(low = "blue", high = "blue", mid = "orange", midpoint = 0, limit = c(-1,1), space = "Lab",name="Pearson\nCorrelation")

# minimal theme 

#Budget
