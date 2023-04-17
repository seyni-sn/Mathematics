function[L]=Lagrange(x,i,X)
n=length(X);
L=1;
for j=1:n
    if(i~=j)
    L=((x-X(j))/(X(i)-X(j)))*L;
    end
end
end