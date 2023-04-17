function[y]=PolynomeLagrange(x,X,Y)
n=length(X);
y=0;
for i=1:n
    L=Lagrange(x,i,X);
    y=y+Y(i)*L;
end
end