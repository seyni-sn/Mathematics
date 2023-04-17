function [X]=GaussJordan(M,b)
n=lebgth(b);
[U,b1]=Gauss1(M,b);
[L,b2]=Gauss1(U,b1);
for i=1:n
    b2(i)=b2(i)/L(i,i);
    L(i,i)=1;
end
X=b2;
end