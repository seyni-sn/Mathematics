%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Methodes Projective(Gradint a pas fixe,a pas optimal ertconjugue  )                %                                   
% Approximatone de solution de systeme lineaire par les methodes Projective         %
% Ax=b, A une matrice carree symetrique definie positive et b vecteur second membre % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%INITILISATION MATHLAB%%%%%%%%%%%%%%%%
close all;
clc;

 %Saisie des ENTREES
 A= input('Donner la matrice du systeme, A:  ');
 b = input('Donner le vecteur second membre , b:  ');
 x0=input('Donner la position initial , xo:  ');
 eps = input('Donner la precision, eps: ');  
 nbreitMax = input('Donner le nombre maximale d''iterration nbreitMax ,nbreitMax:  ');
 %alpha = input('Donner le pas pour la methode du gradient a pas fix, alpha : '); 
 alpha=0.001;%le pas pour la methode du gradient a pas fixe
 
 %Controle de saisi
 [n,n]=size(A);
 test=0;%tester si la matrice est definie positive
for i=1:n
    if(A(1:i,1:i)<=0)
        test=-1;
    end
end

if ((n~=length(b)) || (length(b)~= length(x0)))
error('erreur sur les dimensions');%Afficher un message d'erreur 
end

if(test~=0)
    error('La matrice du systeme n''est pas definie positive');
else if(A~=A')
    error('La matrice du systeme n''est pas symetrique');
    end
end


%%%%%%%%%%%%%%%%METHODE DU GRADIENT A PAS FIXE%%%%%%%%%%%%%%%%%%%%%
[ x1,nbreit1 ] = GradientApasfixe( A,b,eps,x0,alpha,nbreitMax );
plot(x1,'*');%Affiche de la solution obtenu a partir du gradient a pas fixe
%%%%%%%%%%%%%%%%METHODE DU GRADIENT A PAS OPTIMAL%%%%%%%%%%%%%%%%%%%%%
[x2,nbreit2 ] = GradientApasOptimal( A,b,eps,x0,nbreitMax );
plot(x2,':rd');%Affiche de la solution obtenu a partir du gradient a pas optimal
hold on;

%%%%%%%%%%%%%%%%METHODE DU GRADIENT CONJUGUE%%%%%%%%%%%%%%%%%%%%%
[x3,nbreit3 ] = GradientConjuge( A,b,eps,x0,nbreitMax );
plot(x3,'k');%Affiche de la solution obtenu a partir du gradient conjugue

%X=linspace(-1,5,1000);
%Y=linspace(-1,5,1000);
%[X,Y]=meshgrid(X,Y);
%mesh(X,Y);
%shading interp;
 
 