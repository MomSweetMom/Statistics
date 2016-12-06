#here is a correction of the different things that we did together on tuesday

#two important commands: setwd (to change the current work directory) and getwd 
#to know the path of the current work directory

setwd('C:/Users/christine/desktop')  #the path is adapted to my own computer
getwd()

#to load data into the R console one usefull command is read.table

A1=read.table('data1.txt')
A2=read.table('data2.txt')

#we get an error message. To understand the problem open the data2.txt file
#and look at the line 4 where is the problem
#we see that on the first three lines, there exists a space in the name and not 
#in line 4
#so we need to change the separator between variables which is by default the space

A2=read.table('data2.txt',sep='\n')
A3=read.table('data3.txt')
A4=read.table('data4.txt')

#just a remark. I add a file data5.txt where I just add a name to the column

A5=read.table('data5.txt')

#no warning message while the import is false because the software consider the name
#given to the column as an observation and thus all the value are qualitative and
#not quantitative. To see this, just type A5[,1] and you see the information levels
#in the output
#the good import is obtained by

A5=read.table('data5.txt',header=TRUE)

#so this is not because all seems to be good that we obtain the good object!

#representation of A1
#we see that the observations are associated to a qualitative variable and it is categorial
#so the good graphic is a circular diagram

pie(table(A1))
title('circular diagram')   #to add a title to the graphic

#the command table gives the observed count associated to each modality

#representation of A2
#we see that the observations are associated to a qualitative variable and it is ordinal
#so the good graphic is a barplot

barplot(table(A2)/sum(table(A2)))

#or

barplot(table(A2)/length(A2[,1]))

#problem : the order on the x-axis is not correct

w=factor(A2[,1],levels=c('very bad','bad','quite good','good','excellent'))
barplot(table(w)/sum(table(w)))


#representation of A3
#we see that the observations are associated to a quantitative variable and it is discrete
#so the good graphic is a barplot

barplot(table(A3)/sum(table(A3)))

#not good because the x-axis does not take into account with this kind of represenation
#of the distance between values
#better

plot(unique(A3[,1]),table(A3)/length(A3[,1]),type='h',xlab='values',ylab='percent')


#representation of A4
#we see that the observations are associated to a quantitative variable and it is continuous
#to see this

table(A4)
#each value is observed just one time

#so the good graphic is a histogram

hist(A4[,1],freq=FALSE)  #to have the normalisation and not the frequency on the y-axis

#the classes have been done by the R software according to the Sturge's rule

hist(A4[,1],breaks=c(seq(0,0.8,0.1),seq(1,1.8,0.2),3.2),freq=FALSE)

#this allow you to define your classes

H=hist(A4[,1],breaks=c(seq(0,0.8,0.1),seq(1,1.8,0.2),3.2),freq=FALSE)

#in fact a lot of information is available thanks to the hist function
#H is a list of 6 elements
#H$breaks : vector that contains the limit of the classes
#H$counts : vector that contains the frequency of each class
#H$density : vector that contains the height of each class (normalization)
#H$mids : vector that contains the midle of the classes
#H$equidist : a bolean TRUE or FALSE depending where all classes have the same length or not

P=read.table('extra.txt')
X11()     #to open a new graphical window
hist(P[,1],freq=FALSE,braks=20)

X11()     
hist(P[,1],freq=FALSE,braks=50)

X11()     
hist(P[,1],freq=FALSE,braks=100)

X11()     
hist(P[,1],freq=FALSE,braks=150)

X11()
x=seq(-2,6,0.01)
y=dnorm(x,mean=2,sd=1)    #because I simulate the data contained in extra.txt thanks to a gaussian with mean 2 and variance 1
plot(x,y,type='l')


#we see that when the number of classes becomes large and thus the length of each class becomes small,
#the histogram fits better the density.








