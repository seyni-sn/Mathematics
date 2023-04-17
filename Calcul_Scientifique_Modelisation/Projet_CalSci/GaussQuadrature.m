 % Algorithm de methode d'integration par la formule de quadrature de GAUSS 
 % Ici nous assayons d'avoir une approximation de l'integral de f(x)=sin(x) sur [0,pi].
 %Le vecteur x wontient les neouds
 %Le vecteur w wontient les poids
 
 close all;
 clc;
 
 %Saisi de l'inxervale [a,b] dans le quel on veux approcher y
 a = input('Entrer l''origine de l''intervale, a:  ');
 b = input('Entrer l''exxremixer de l''intervale, b:  ');
 n = input('Entrer  l''order, n:  ');
 
 if (n < 2 || n > 8)
   fprintf('Ce progamme ne marche que les ordre compris entre 2 et 8\n');
 else
   a0 = (b+a)/2;
   a1 = (b-a)/2;
   %Calcule des piods et des noeuds
 if (n == 2)
   w(1) = 1.0;
   w(2) = w(1);
   x(1) = -0.577350269;
   x(2) = -x(1);
 elseif (n == 3)
   w(1) = 0.555555556;
   w(2) = 0.888888889;
   w(3) = w(1);
   x(1) = -0.774596669;
   x(2) = 0.0;
   x(3) = -x(1);
 elseif (n == 4)
   w(1) = 0.347854845;
   w(2) = 0.652145155;
   w(3) = w(2);
   w(4) = w(1);
   x(1) = -0.861136312;
   x(2) = -0.339981044;
   x(3) = -x(2);
   x(4) = -x(1);
 elseif (n == 5)
   w(1) = 0.236926885;
   w(2) = 0.478628670;
   w(3) = 0.568888889;
   w(4) = w(2);
   w(5) = w(1);
   x(1) = -0.906179846;
   x(2) = -0.538469310;
   x(3) = 0.0;
   x(4) = -x(2);
   x(5) = -x(1);
 elseif (n == 6)
   w(1) = 0.171324492;
   w(2) = 0.360761573;
   w(3) = 0.467913935;
   w(4) = w(3);
   w(5) = w(2);
   w(6) = w(1);
   x(1) = -0.932469514;
   x(2) = -0.661209386;
   x(3) = -0.238619186;
   x(4) = -x(3);
   x(5) = -x(2);
   x(6) = -x(1);
 elseif (n == 7)
   w(1) = 0.129484966;
   w(2) = 0.279705391;
   w(3) = 0.381830050;
   w(4) = 0.417959184;
   w(5) = w(3);
   w(6) = w(2);
   w(7) = w(1);
   x(1) = -0.949107912;
   x(2) = -0.741531186;
   x(3) = -0.405845151;
   x(4) = 0.0;
   x(5) = -x(3);
   x(6) = -x(2);
   x(7) = -x(1);
 elseif (n == 8)
   w(1) = 0.101228536;
   w(2) = 0.222381034;
   w(3) = 0.313706645;
   w(4) = 0.362683783;
   w(5) = w(4);
   w(6) = w(3);
   w(7) = w(2);
   w(8) = w(1);
 x(1) = -0.960289856;
 x(2) = -0.796666477;
 x(3) = -0.525532409;
 x(4) = -0.183434642;
 x(5) = -x(4);
 x(6) = -x(3);
 x(7) = -x(2);
 x(8) = -x(1);
end
%Calcule e l'integrale
 Integral = 0.0;
 for i = 1:1:n
 x(i) = a0 + a1*x(i);
 f=zeros(n);
 f(i) = funct(x(i));
 Integral = Integral + w(i)*f(i);
 end
 Integral = Integral*a1;
 fprintf('L''integrale est : %10.8f\n\n',Integral);
end
