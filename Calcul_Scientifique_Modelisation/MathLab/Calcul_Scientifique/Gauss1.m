function [ U,b1] = Gauss1(M,b )%transforme une matrice en une matrice triangulaire sup et transform b aussi
n=length(b);
for i=1:n-1
    for j=i+1:n
        b(j)=b(j) -(M(j,i)/M(i,i))*b(i) ;
        M(j,:)=M(j,:)-(M(j,i)/M(i,i))*M(i,:);
    end
end
    U=M;
    b1=b;
end

