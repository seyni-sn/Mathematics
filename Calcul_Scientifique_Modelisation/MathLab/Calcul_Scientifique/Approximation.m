function [ A,b,P] = Approximation( x,y,m )
A=zeros(m,m);
b=zeros(m);
moyy=Moyenne(y);
for i=1:m
    for j=1:m
        A(i,j)=Moyenne(x^(i+j-2));
    end
    b(i)=Moyenne(x^(i-1))*moyy;
end
P=inv(A).*b;
end
