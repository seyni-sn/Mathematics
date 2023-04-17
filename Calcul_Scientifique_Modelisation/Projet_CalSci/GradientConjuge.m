function [ sol,nbreit ] = GradientConjuge( A,b,eps,x0,nbreitMax )
%%%%%%%%%%%%%% ENTREES %%%%%%%%
%A:Matrice du systeme
%b:Vecteur second membre
%eps:Precision ou tolerence
%x0:Position initiale
%nbreitMax:Nombre maximal d'itterration
%%%%%%%%%%%%%% SORTIES %%%%%%%%
%sol:Solution
%xit:Vecteur contenant les different minimum locaux
%nbreit:Nombre ditteration
%
i=1;
 x=x0;
 g=b-A.*x0;%g:Inverse du gradient
 d=g;%d:direction de descente initiallement egal a g
 
 while(norm(d)>eps) &&(i<nbreitMax)
  alpha=(g'.*d)/(d'.*A.*d);%alpha:Pas optimal
  x=x+alpha*d;%Avacement optimal suivant la direction d
  g0=g;%Conservation g_i avant le calcule de g_i+1
  g=g+alpha.*A.*d;
  gama=(g'.*g)/(g0'.*g0);
  d=g+gama.*d;
  i=i+1;
end
sol=x;
nbreit=i;
fprintf('Pour la methode du gradient cojugue la solution :\n')
disp(sol);
fprintf('\n Obtenu en %d iterration', nbreit);
end
