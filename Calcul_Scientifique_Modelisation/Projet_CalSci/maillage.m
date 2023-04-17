function [h,x]=maillage(a,b,n)
x=zeros(n);%Intialisation du vecteur x contenant les noeuds x(i)
if(a>=b && n<=0)
    disp('Ereur!!!');
    else
    h=(b-a)/n;%pas de la subdivision 
    for i=1:n+1
        x(i)=a + (i-1)*h;
    end
end
end

