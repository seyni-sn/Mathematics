function [ sol,nbreit ] = GradientApasfixe( A,b,eps,x0,alpha,nbreitMax )
%%%%%%%%%%%%%% ENTREES %%%%%%%%
%A:Matrice du systeme
%b:Vecteur second membre
%eps:Precision ou tolerence
%x0:Position initiale
%alpha:Le pas fixe choisit 
%nbreitMax:Nombre maximal d'itterration
%%%%%%%%%%%%%% SORTIES %%%%%%%%
%sol:Solution
%nbreit:Nombre ditteration
i=1;
 x=x0;
 d=b-A.*x0;%d:Direction de descsnte choisit comme inverse du gradiant
 
 while(norm(d)>eps) &&(i<nbreitMax)
  d=b-A.*x;
  x=x+alpha.*d;%avancement suivant la direction d
  i=i+1;
end
sol=x;
nbreit=i;
fprintf('Pour la methode du gradient a pas fixe la solution :\n')
disp(sol);
fprintf('\n Obtenu en %d iterration', nbreit);
end

