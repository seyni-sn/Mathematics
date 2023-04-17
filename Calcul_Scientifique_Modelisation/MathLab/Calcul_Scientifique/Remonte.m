function [ x ] = Remonte( U,b )
n=length(b);
if(triu(U)~=U)
    disp('Impossible d''utuliser cette methode car la matrice donnee n''est pas triangulaire superieur');
else if (det(U)==0)
     disp('Impossible d''utuliser cette methode car la matrice n''est pas inversible ');
else
    x(n)=b(n)/U(n,n);
    for i=n-1:-1:1
        s=0;
        for j=i+1:n
            s=s+U(i,j)*x(j);
        end
        x(i)=(b(i)-s)/U(i,i);
    end
end

end

