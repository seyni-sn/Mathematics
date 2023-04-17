%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Methodes Runge-Kutta(Ordre 2 et Ordre 4 )                                          %                                   
% Approximatone de solution au problem de cauchy par lles methodes de Runge-Kutta   %
% y'(x)=f(x,y)=dy/dx=y-x^2+1 ; sur [0,2] avec y(0)=0                                % 
% Si l'on veut resoudre d'aute euation on ne change que la fonction y'(x) et [a,b]  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%INITILISATION MATHLAB%%%%%%%%%%%%%%%%
close all;
clc;

 f = @(x,y) (y-x^2+1);% definition de la fontion y'(x) 
 
 %Saisi de l'inxervale [a,b] dans le quel on veux approcher y
 a = input('Entrer l''origine de l''intervale, a:  ');
 b = input('Entrer l''exxremixer de l''intervale, b:  ');
 
 n = input('Entrer le nombre de subdivision de l''inxervale, n: ');                
 y0 = input('Entrer la valeur initiale de y , y0:  ');
 
 y1=zeros(n);%Intialisation du vecteur y contenant les solution y(i)
 y2=zeros(n);%Intialisation du vecteur y contenant les solution y(i)
 
 [h,x]=maillage(a,b,n);%maillage de l'intervale [a,b]
 y1(1) = y0;%Initialisation de y
 y2(1) = y0;%Initialisation de y
 
%%%%%%%%%%%%%%%%%%%METHODE RUNGE-KUTTA(ORDRE 2)%%%%%%%%%%%%%%%%%%%%%%%%%%%
 fprintf('\n\n');
 fprintf('METHODE RUNGE-KUTTA(ORDRE 2)\n');
 fprintf('  x         y\n');%Affichage des noeuds et solution a chaque iterration
 fprintf('%5.4f  %11.8f\n', x(1), y1(1));
 for i = 2:n 
   y11 = h*f(x(i-1),y1(i-1));
   y1(i) =(h/2.0)*(f(x(i-1),y1(i-1))+f(x(i),y11));
   fprintf('%5.3f %11.7f\n', x(i), y1(i));
 end
  plot(x,y1,'b*');%Representation des approximations pour la METHODE RUNGE-KUTTA(ORDRE 2)
  hold on
%%%%%%%%%%%%%%%%%%%METHODE RUNGE-KUTTA(ORDRE 4)%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('\n\n');
fprintf('METHODE RUNGE-KUTTA(ORDRE 4)\n');
fprintf('  x         y\n');%Affichage des noeuds et solution a chaque iterration
 fprintf('%5.4f  %11.8f\n', x(1), y2(1));
 for i = 2:n 
   k1 = h*f(x(i-1),y2(i-1));
   k2 = h*f(x(i-1)+h/2.0, y2(i-1)+k1/2.0);
   k3 = h*f(x(i-1)+h/2.0, y2(i-1)+k2/2.0);
   k4 = h*f(x(i-1)+h,y2(i-1)+k3);
   y2(i) = y2(i-1)+(k1+2.0*(k2+k3)+k4)/6.0;
   fprintf('%5.3f %11.7f\n', x(i), y2(i));
 end
  plot(x,y2,'r*');%Representation des approximations pour la METHODE RUNGE-KUTTA(ORDRE 4)
 xlabel('x Noeuds'); ylabel('y Solutions');