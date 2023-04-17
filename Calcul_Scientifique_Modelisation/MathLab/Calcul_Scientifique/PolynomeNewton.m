function[y]=PolynomeNewton(x,X,Y)
n=length(X);
%lmda=zeroes(n);
for i=1:n %on recupere les different coeff dans un vecteur
    lmda(i)=RecherchLamda(X,Y,i);
end
y=lmda(1);
for j=2:n
    p=lmda(j);
    for k=2:j
        p=p*(x-X(k-1));
    end
    y=y+p;
end
end
    