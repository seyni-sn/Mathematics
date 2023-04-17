function [ sol,nbreit ] = GradientApasOptimal( A,b,eps,x0,nbreitMax )
%%%%%%%%%%%%%% ENTREES %%%%%%%%
%A:Matrice du systeme
%b:Vecteur second membre
%eps:Precision ou tolerence
%x0:Position initiale
%nbreitMax:Nombre maximal d'itterration
%%%%%%%%%%%%%% SORTIES %%%%%%%%
%sol:Solution
%nbreit:Nombre ditteration
i=1;
 x=x0;
 d=b-A.*x0;%d:Direction de descsnte choisit comme inverse du gradiant
 
 while(norm(d)>eps) &&(i<nbreitMax)
  d=b-A.*x;
  alpha=(d'.*d)/(d'.*A.*d);%alpha:Pas optimal
  x=x+alpha*d;%avancement optimal suivant la direction d
  i=i+1;
end
sol=x;
nbreit=i;
fprintf('Pour la methode du gradient a pas optimal la solution :\n')
disp(sol);
fprintf('\n Obtenu en %d iterration', nbreit);
end