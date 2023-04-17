
###########################
#NOMS: Seyni KANE         #
#      Fatou Diop NGOM    #
#      Ramatoulaye DIALLO #
###########################################################################
# La reponce de ceertains questions se trouvent dans le compte rendu(PDF) #
###########################################################################


NOSDATA=read.csv(file = "Projet AD.csv")
View(NOSDATA)
moy1=sum(NOSDATA[,1])/length(NOSDATA[,1])

moy2=sum(NOSDATA[,2])/length(NOSDATA[,2])

c1=(NOSDATA[,1]-moy1)^2#un vecteurc1 avec c1[i]=(xi-moyenne)^2
sv=sum(c1)#somme des (xi-moyenne) au carre
v1=sv/length(NOSDATA[,1])#calcule de la variance
ect1=sqrt(v1)#Ecartype de la premiere variable

c1=(NOSDATA[,1]-moy2)^2#un vecteurc1 avec c1[i]=(xi-moyenne)
sv=sum(c1)#somme des (xi-moyenne) au carre
v2=sv/length(NOSDATA[,1])#calcule de la variance
ect2=sqrt(v2)#Ecartype de la deuxieme 

plot(NOSDATA[,1],NOSDATA[,2],xlab="Duree(jrs)",ylab = "Pertes",type = "p",lwd=3,col="cyan")#Affiche les pertes en fonction de la duree

a=cov(NOSDATA[,1],NOSDATA[,2])/var(NOSDATA[,1])#Calcule de pente de la droite de regression lineaire
b=mean(NOSDATA[,2])-a*mean(NOSDATA[,1])#Calcule du coefficient a lorigine

y=a*NOSDATA[,1]+b
lines(NOSDATA[,1],y,type="l",col="blue")#Affichage de la droite de regression lineaire

R2=(cov(NOSDATA[,1],NOSDATA[,2]))^2/(var(NOSDATA[,1])*var(NOSDATA[,2]))#Calcul du coefficient de determination

