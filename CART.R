library(rpart)
?rpart
data(mtcars)
View(mtcars)
Y = mtcars$mpg # Response
X = mtcars[, -1] # Predictor
T = rpart(Y~., data=X)
T$frame
# With small amount of minsplit, overfitting is present 
T = rpart(Y~., data=X, control = rpart.control(minsplit = 2, cp = 10^(-15)))
names(T)
A = T[[1]]
A
w=which(A[,1]=='<leaf>')
as.vector(w)
A[,1]
B = A[w,]
B

plot(T)
# Parameters used in CART
T[[8]]
# Importance Variables
T[[12]]
text(T, cex=0.75)
par(mar=c(5.1,4.1,4.1,2.1))
par(mfrow=c(1,1))
par(mfrow=c(2,2))
T
hY = predict(T)
hY
error = 1/nrow(mtcars) * sum((Y-hY)^2)
error
names(T)
summary(T)
T$frame
