function [ x ] = Decente( L,b )
if(tril(L)~= L)
    disp('Impossible d''utuliser cette methode car la matrice n''est pas triangulaire inferieur ');
    x=-1;
else if(det(L)==0)
     disp('Impossible d''utuliser cette methode car la matrice n''est pas inversible ');
     x=-1;
    else
    n=length(b);
    x(1)=b(1)/L(1,1);
    for i=2:n
        s=0;
        for j=1:i-1
            s=s+L(i,j)*x(j);
        end
        x(i)=(b(i)-s)/L(i,i);
    end
end
end

