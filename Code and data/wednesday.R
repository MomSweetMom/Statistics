#thanks to the setwd() command we change the directory associated to the
#current workspace in order to associate the current workspace to the directory
#that contains the exo1.txt file.

D=read.table('exo1.txt')

#we want to see if the data can be homogeneous Poisson process.

#we should see if the total number of points on a trial is a Poisson variable
#with parameter lambda*T where T is the time of the recording and 
#lambda is the instantaneous firing rate

N=D[,1]			#the first column contains the number of points for
#each trial

plot(sort(unique(N)),table(N)/length(N),type='h',ylab='percent',xlab='number of observations')		
title('distribution of the number of observations')

#to superpose the theoretical distribution, we need to estimate the parameter
#of the Poisson variable

#the parameter of a Poisson variable is the expectation. Because an estimator of
#the expectation is given by the empirical mean, an estimation of the parameter
#is the mean of N

hatlambdaT=mean(N)
x=min(N):max(N)
y=dpois(x,hatlambdaT)
lines(x,y,col='red')	#we prefer to draw a line even if this is a discrete
#random variable just to see more the theoretical 
#distribution


#an estimation of T is jsut obtained by looking at the maximum of each trial
#and by taking the maximum among all the trial

M=apply(D[,-1],1,max)	#the 1 is to compute the maximum on each row of the M object
hatT=max(M)

#we deduce an estimation of lambda by
hatlambda=hatlambdaT/hatT

#to look to see if the time of arrival between to events is exponential, we work
#on one trial

k=D[1,1]
delay=D[1,3:(k+1)]-D[1,2:k]
hist(as.numeric(delay),freq=FALSE)
x=seq(0,hatT,0.01)
lines(x,dexp(x,hatlambda),col='red')

#the two graphics seem to say that the data are potentialy from a homogeneous 
#Poisson process

P=table(N)
K=sort(unique(N))
p=ppois(K,hatlambdaT)
np=sum(P)*p

#because all the np are not bigger than 5 we should grouped the first 4 values
P1=c(sum(P[1:4]),P[5:length(P)])
p1=c(sum(p[1:4]),p[5:length(p)])
np1=sum(P)*p1
chisq.test(P1,p1)

#we can not use immediately the p-value because we have estimated one parameter

pvalue=pchisq(2376,2351)		#we use the values that are in the outputs 
#of chisq.test

#the pvalue is very big, thus we do not reject H0
#the Poisson hypothesis is ok

pexpo<-function(x)
{pexpo<-pexp(x,hatlambda)}

ks.test(delay,pexpo)
#same conclusion


#thanks to the setwd() command we change the directory associated to the
#current workspace in order to associate the current workspace to the directory
#that contains the ukcomp1_r.dat file.

ukcomp=read.table('ukcomp1_r.dat')  #we try to import the dataset

head(ukcomp)				#to print the first rows of ukcomp

#we see that the importation is not correct since the first row contains here 
#the name of the columns

cor(ukcomp[,-1])				#to see if there exists strong correlations
#between the explanatory variables
#yes this is the case because some correlations
#are equal to 0.96

pairs(~.,data=ukcomp[,-1])		#a way to represent the cloud of points
#of each pair of variables

ukcomp=read.table('ukcomp1_r.dat',header=TRUE)	#correction for the importation

model=lm(RETCAP~.,data=ukcomp)	#computation of the linear model that explianed
#the variable RETCAP thanks to all the other
#variables

model						#to print the outputs of model

#the outputs are the estimation of the coefficients of the linear model

summary(model)				#to have some other informations

#we have some additionnal informations on the residuals and on the estimations
#of the coefficients.
#about the coefficients :
#the first column contains the estimations, the second column contains the
#standard deviation of the estimation of the variance of the estimator,
#the third column contains the observed value of the student statistic
#for testing H0: the considered coefficient is null against H1: the considered
#coefficient is not null, and the last column contains the p-value associated
#to the test. When the p-value is smaller than alpha, we reject H0 otherwise
#we do not reject H0.
#be carefull, if we do not reject H0 for several coefficient, we can not delete
#all the coefficient by we should have a strategy step by step.

#the third column is just the ratio between the first one and the second one.

#then there is 3 lines.
#the residual standard error is just the square root of the estimation of sigma square
#the 27 is the degree of freedom associated to the estimator of sigma sqaure.
#the degree of freedom (DF) is equal to n-p-1 where p is the number of variables

ukcomp=as.matrix(ukcomp)		#we change to a matrix to have numeric variables

Y=ukcomp[,1]
#because the extraction of just one column, the type of Y is a vector
#we prefer to have a column matrix

Y=matrix(data=Y,ncol=1)
X=ukcomp
X[,1]=rep(1,length(Y))

hatbeta=solve(t(X)%*%X)*t(X)%*%Y

#we find the first column of the previous array.