%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Methodes d'EULER et d'EULER amerliorer (explicite)                                                         %                                   
% Approximatone de soluxion au problem de cauchy par les methodes d'EULER explicte    %
% y'(x)=f(x,y)=dy/dx=y-x^2+1 ; sur [0,2] avec y(0)=0                                % 
% Si l'on veut resoudre d'autre equation on ne change que la fonction y'(x) et [a,b]  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%INITILISATION MATHLAB%%%%%%%%%%%%%%%%
close all;
clc;

 f = @(x,y) (y-x^2+1);% definition de la fontion y'(x) 
 
 %Saisi de l'inxervale [a,b] dans le quel on veux approcher y
 a = input('Entrer l''origine de l''intervale, a:  ');
 b = input('Entrer l''exxremixer de l''intervale, b:  ');
 
 n = input('Entrer le nombre de subdivision de l''inxervale, n: ');                
 y0 = input('Entrer la valeur initiale de y ,: y0  ');
 
 y1=zeros(n);%Intialisation du vecteur y contenant les solution y(i)
 y2=zeros(n);%Intialisation du vecteur y contenant les solution y(i)
 [h,x]=maillage(a,b,n);%maillage de l'intervale [a,b]
 
 y1(1) = y0;%Initialisation de y
 y2(1) = y0;%Initialisation de y
 
%%%%%%%%%%%%%%%%%%%D'EULER(EXPLICITE)%%%%%%%%%%%%%%%%%%%%%%%%%%%
 fprintf('\n\n');
 fprintf('METHODE D''EULER(EXPLICITE)\n');
 fprintf('  x         y\n');%Affichage des noeuds et solution a chaque iterration
 fprintf('%5.4f  %11.8f\n', x(1), y1(1));
 for i = 2:n 
 y1(i) = y1(i-1)+h*f(x(i-1), y1(i-1));%calcule des y(i)
 fprintf('%5.4f  %11.8f\n', x(i), y1(i));
 end
 plot(x,y1,'b*');%Representation des approximations pour la METHODE D'EULER(EXPLICITE)
 xlabel('x Noeuds'); ylabel('y Solutions');
 hold on
 
 %%%%%%%%%%%%%%%%%%%D'EULER AMELIORE (EXPLICITE)%%%%%%%%%%%%%%%%%%%%%%%%%%%
  fprintf('\n\n');
  fprintf('METHODE D''EULER AMELIORE(EXPLICITE)\n');
  fprintf('  x         y\n');%Affichage des noeuds et solution a chaque iterration
  fprintf('%5.4f  %11.8f\n', x(1), y1(1));
  for i = 2:n 
 y21 =y2(i-1)+ (h/2.0)*f(x(i-1),y2(i-1));
 y2(i) = y2(i-1)+h*f(x(i-1)+h/2.0,y21);%calcule des y(i)
 fprintf('%5.4f  %11.8f\n', x(i), y2(i));
 end
 plot(x,y2,'r*');%Representation des approximations pour la METHODE D'EULER AMELIORE(EXPLICITE)