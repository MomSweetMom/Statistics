#### MDS VILLES DATA ####
mdsville=read.table("mdsville.dat",fill=TRUE)
View(mdsville)

# Preprocessing
villes=as.character(mdsville[2:48,1])
m=mdsville[2:48,2:48]
m=as.matrix(m)
m=as.numeric(m)
m=matrix(m,47,47)
dimnames(m)[[1]]=villes
dimnames(m)[[2]]=villes
View(m)
d=as.dist(m,diag=TRUE)
d

# Perform Hierarchical Clustering
chv = hclust(d, method="ward.D2")
chv$height
names(chv)
plot(chv,main=NULL,sub="",xlab="")
class(cophenetic(chv))

# Check the correlation of cophenetic and original distance
cor(cophenetic(chv),d)
plot(chv$height[46:30],xlab="nb de classes",ylab="Hauteur")
# Cut a tree into groups of data
color=cutree(chv,k=5)

library(cluster)
# Compute or Extract Silhouette information from clustering
plot(silhouette(color,d))
mds = silhouette(color,d)
plot(mds, type="n", xlab="cp1", ylab="cp2")
text(mds,villes,col=color)

chv <- hclust(d, method="single")
cor(cophenetic(chv),d)
plot(chv,main=NULL,sub="",xlab="")
plot(chv$height[46:25],xlab="Nombre de classes",ylab="Hauteur")

# Cut a tree into groups of data
color=cutree(chv,k=5)  # h=<height>

# Make presentation by superpositioning onto 2-dimensional plane
mds = cmdscale(d, k=2)
plot(mds, type="n", xlab="cp1", ylab="cp2")
text(mds,villes,col=color)

#### OECD DATA ####
ocde=read.table("ocdeR.dat")
View(ocde)
# Center = TRUE, scale = TRUE
ds=dist(scale(ocde))
hc.ds <- hclust(ds,method="ward")
plot(hc.ds)
plot(hc.ds$height[67 :58],type="b")
color = cutree(hc.ds,k=4)
color

library(cluster)
plot(silhouette(color,ds))
cor(cophenetic(hc.ds),ds)

acp=princomp(ocde, cor=TRUE)
acp$scale
summary(acp)
plot(acp)

apply(ocde, 2, mean)
apply(ocde, 2, sd)

kocde=kmeans(scale(ocde),3)
color=kocde$cluster
color
plot(acp$scores[,1],acp$scores[,2], col=color)

kocde=kmeans(ocde,4)
color=kocde$cluster
color
plot(acp$scores[,1],acp$scores[,2], col=color)

plot(silhouette(color,ds))

install.packages("lasso2")
library(lasso2)
View(Prostate)
data(Prostate)
summary(Prostate)
Prostate$svi=as.factor(Prostate$svi)
Prostate$gleason=as.factor(Prostate$gleason)

dim(Prostate)
?Prostate
dim(Prostate)
names(Prostate)
summary(Prostate)
str(Prostate)
# Subpress qualitative variables
cor(Prostate[,-c(5,7)])
hist(Prostate$lpsa)

ind.test=4*c(1:22)
ind.test
Prostate.app=Prostate[-ind.test,]
Prostate.test=Prostate[c(ind.test),]
dim(Prostate.test)
dim(Prostate.app)
ntest=length(Prostate.test$lpsa)
ntest 
napp=length(Prostate.app$lpsa)
napp
summary(Prostate.app)
summary(Prostate.test)

plot.res=function(x,y,titre="")
{
    plot(x,y,col="blue",ylab="RÈsidus",
         xlab="Valeurs predites",main=titre)
    abline(h=0,col="green")
}

modlin=lm(lpsa~., data=Prostate.app)
summary(modlin)
res=residuals(modlin)
par(mfrow=c(1,2))
hist(residuals(modlin))
qqnorm(res)
qqline(res, col = 2)
par(mfrow=c(1,1))
plot.res(predict(modlin),res)

mean(res**2)

pred.test=predict(modlin, newdata=Prostate.test)
res.test=pred.test-Prostate.test$lpsa
mean(res.test**2)

contrasts(Prostate.app$svi)=contr.sum(levels(Prostate.app$svi))
contrasts(Prostate.app$gleason)=contr.sum(levels(Prostate.app$gleason))
modlin2=lm(lpsa~., Prostate.app)
summary(modlin2)

library(MASS)
modselect_b=stepAIC(modlin2,~.,trace=TRUE,direction=c("backward"))
summary(modselect_b)

mod0=lm(lpsa~1,data=Prostate.app)
modselect_f=stepAIC(mod0,lpsa~lcavol+lweight+age+lbph+svi+lcp+gleason+pgg45,data=Prostate.app,trace=TRUE,direction=c("forward"))
summary(modselect_f)

modselect=stepAIC(modlin2,~.,trace=TRUE,direction=c("both"))
summary(modselect)

modselect_BIC=stepAIC(modlin2,~.,trace=TRUE,direction=c("both"),k=log(napp))
summary(modselect_BIC)

mean((predict(modselect)-Prostate.app[,"lpsa"])**2)
mean((predict(modselect_BIC)-Prostate.app[,"lpsa"])**2)

mean((predict(modselect,newdata=Prostate.test)-Prostate.test[,"lpsa"])**2)
mean((predict(modselect_BIC,newdata=Prostate.test)-Prostate.test[,"lpsa"])**2)

library(MASS)
mod.ridge=lm.ridge(lpsa~.,data=Prostate.app,lambda=seq(0,20,0.1))
par(mfrow=c(1,1))
plot(mod.ridge)
matplot(t(mod.ridge$coef),lty=1:3,type="l",col=1:10)
legend("top",legend=rownames(mod.ridge$coef),col=1:10,lty=1:3)

select(mod.ridge)
mod.ridgeopt=lm.ridge(lpsa ~  .,data=Prostate.app,lambda=10.4)

coeff=coef(mod.ridgeopt)

svi0.app=1*c(Prostate.app$svi==0)
svi1.app=1-svi0.app
gl6.app=1*c(Prostate.app$gleason==6)
gl7.app=1*c(Prostate.app$gleason==7)
gl8.app=1*c(Prostate.app$gleason==8)
gl9.app=1*c(Prostate.app$gleason==9)
lcavol.app=Prostate.app$lcavol
lweight.app=Prostate.app$lweight
age.app=Prostate.app$age
lbph.app=Prostate.app$lbph
lcp.app=Prostate.app$lcp
pgg45.app=Prostate.app$pgg45

fit.rid=rep(coeff[1],napp)+coeff[2]*lcavol.app+coeff[3]*lweight.app+coeff[4]*age.app+coeff[5]*lbph.app+coeff[6]*svi0.app-coeff[6]*svi1.app+coeff[7]*lcp.app+coeff[8]*gl6.app+coeff[9]*gl7.app+coeff[10]*gl8.app-(coeff[8]+coeff[9]+coeff[10])*gl9.app+coeff[11]*pgg45.app

plot(Prostate.app$lpsa,fit.rid)
abline(0,1)
res.rid=fit.rid-Prostate.app[,"lpsa"]
plot.res(fit.rid,res.rid,titre="")
mean(res.rid**2)

svi0.t=1*c(Prostate.test$svi==0)
svi1.t=1-svi0.t
gl6.t=1*c(Prostate.test$gleason==6)
gl7.t=1*c(Prostate.test$gleason==7)
gl8.t=1*c(Prostate.test$gleason==8)
gl9.t=1*c(Prostate.test$gleason==9)

lcavol.t=Prostate.test$lcavol
lweight.t=Prostate.test$lweight
age.t=Prostate.test$age
lbph.t=Prostate.test$lbph
lcp.t=Prostate.test$lcp
pgg45.t=Prostate.test$pgg45

prediction=rep(coeff[1],ntest)+coeff[2]*lcavol.t+coeff[3]*lweight.t+coeff[4]*age.t+coeff[5]*lbph.t+coeff[6]*svi0.t-coeff[6]*svi1.t+coeff[7]*lcp.t+coeff[8]*gl6.t+coeff[9]*gl7.t+coeff[10]*gl8.t-(coeff[8]+coeff[9]+coeff[10])*gl9.t+coeff[11]*pgg45.t

mean((Prostate.test[,"lpsa"]-prediction)^2)

library(lasso2)
l1c.P <- l1ce(lpsa ~ ., Prostate.app,bound=(1:100)/100,absolute.t=FALSE)

coefficients=coef(l1c.P)
plot(l1c.P,col=1:11,lty=1:3,type="l")
legend("topleft",legend=colnames(coefficients),col=1:11,lty=1:3)

penalite_relative=c(1:100)/100
matplot(penalite_relative,coefficients[,-1],
        lty=1:3,type="l",col=1:10)
legend("topleft",legend=colnames(coefficients[,-1]),col=1:10,lty=1:3)

vc=gcv(l1c.P)
crit.vc=vc[,"gcv"]
bound_opt=vc[which.min(crit.vc),"rel.bound"]
l1c.opt <- l1ce(lpsa ~ ., Prostate.app,bound=bound_opt, absolute.t=FALSE)
coef=coef(l1c.opt)

fit=fitted(l1c.opt)
mean((fit-Prostate.app[,"lpsa"])^2)

prediction=predict(l1c.opt,newdata=Prostate.test)
mean((prediction-Prostate.test[,"lpsa"])^2)

library(pls)
mod.pcr = pcr(lpsa~.,data=Prostate.app, ncomp=9,validation="CV")
summary(mod.pcr)
plot(mod.pcr,"val")
predapp.pls=predict(mod.pcr,ncomp=8)
resapp.pls=predapp.pls-Prostate.app$lpsa
mean(resapp.pls**2)
pred.pcr=predict(mod.pcr,newdata=Prostate.test,ncomp=8)
mean((pred.pcr-Prostate.test[,"lpsa"])**2)






