function[m]=Moyenne(X)
n=length(X);
s=0;
for i=1:n
    s=s+X(i);
end
m=s/n;
end