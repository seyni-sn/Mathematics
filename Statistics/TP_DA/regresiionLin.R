
 Mabase=read.csv(file = "TPADR.csv",sep=";")#experte un fichier dans r
 View(Mabase)#Affiche le fichier
 s1=sum(Mabase[,1])#calcal de somme de la 1er colonne
 m1=s1/length(Mabase[,1])#Calcul de la moyenne 1er colone
 s2=sum(Mabase[,2])#calcal de somme de la 2eme colonne
 m2=s2/length(Mabase[,2])#Calcul de la moyenne 1eme colone
 #
 #calcule de variance
 #
 c1=(Mabase[,1]-m1)^2#un vecteurc1 avec c1[i]=(xi-moyenne)
 sv=sum(c1)#somme des (xi-moyenne) au carre
 v1=sv/length(Mabase[,1])#calcule de la variance
 plot(Mabase[,1],Mabase[,2],xlab="age",ylab = "poid",type = "h",lwd=3,col="cyan")#Affiche le piod en fonction de l'age
a=cov(Mabase[,1],Mabase[,2])/var(Mabase[,1])
b=mean(Mabase[,2])-a*mean(Mabase[,1])
y=a*Mabase[,1]+b+e
plot(Mabase[,1],y,type="l",col="blue")


