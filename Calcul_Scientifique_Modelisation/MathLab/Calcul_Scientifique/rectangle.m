function [ Iapp] = rectangleIntegr( a,b,N )
[h,x]=maillage(a,b,N);
Iapp=0;
for k=1:N
    Iapp=Iapp+f(x(k));
end
Iapp=h*Iapp1;


end

