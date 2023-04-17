Mabase=read.csv(file = "Projet AD.csv" )#experte un fichier dans R
s1=sum(Mabase[,1])#calcal de somme de la 1er colonne
m1=s1/length(Mabase[,1])#Calcul de la moyenne 1er colone
s2=sum(Mabase[,2])#calcal de somme de la 2eme colonne
m2=s2/length(Mabase[,2])#Calcul de la moyenne 1eme colone

plot(Mabase[,1],Mabase[,2],xlab="Durees",ylab = "Pertes",type = "p",lwd=3,col="cyan")#Affiche le piod en fonction de l'ageView(Mabase)#Affiche le fichier



