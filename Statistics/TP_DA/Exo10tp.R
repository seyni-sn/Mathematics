data("iris")#pour importer iris a partir de R(import de fichier sous R)
View(iris)#pour le visualiser
moy1=mean(iris[1:50,1])#moyenne de Sepal.length
e1=sd(iris[1:50,1])#ecartype de Sepal.length
moy2=mean(iris[,2])
e2=sd(iris[,2])
plot(iris[1:50,1],iris[1:50,2],xlab="Sepal.length",ylab = "Sepal.width",type = "l",lwd=3,col="cyan",lty=2,main="flowers")
#
a=cov(iris[1:50,1],iris[1:50,2])/var(iris[1:50,1])
b=mean(iris[1:50,2])-a*mean(iris[,1])
yest=a*iris[1:50,1]+b
e=iris[1:50,2]-yest
moyer0r=mean(e)
y=a*iris[1:50,1]+b+e
#lines(iris[1:50,1],y,xlab="Sepal.length",ylab = "Sepal.width",type="l",col="blue")
points(iris[1:50,1],yest,xlab="Sepal.length",ylab = "Sepal.width",type="l",col="blue")#pour pouvoir tracer sur le graph precedant
#plot(density(e))#pour verifier que sa suit la loi normal (0,var)
sct=sum((y-moy2)^2)
scr=sum(e^2)
R2=1-scr/sct
model=lm(iris[,2]~iris[,1],data = iris)
summary(model)
plot(model)


