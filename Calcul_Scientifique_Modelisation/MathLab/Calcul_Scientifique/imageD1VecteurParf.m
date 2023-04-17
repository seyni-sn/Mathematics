function[Y]=imageD1VecteurParf(X)
n=length(X);
Y=zeroes(n);
for i=1:n
    Y(i)=fonction(X(i));
end
end