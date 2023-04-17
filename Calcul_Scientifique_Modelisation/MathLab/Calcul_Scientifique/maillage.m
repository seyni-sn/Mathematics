function [h,x]=maillage(a,b,n)
%x=zeroes(n);
if(a>=b && n<=0)
    disp('Ereur!!!');
%else if (n<=0)
        %disp('Donner un entier positive');
    else
    h=(b-a)/n;
    for i=1:n+1
        x(i)=a + (i-1)*h;
    end
%end
end
end