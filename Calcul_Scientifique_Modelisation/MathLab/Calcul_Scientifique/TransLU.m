function [L,U]=TransLU(A)
n=size(A);
U=A;
L=eye(n);
for k=1:n
    p=U(k,k);
    for i=k+1:n
        q=U(i,k);
        U(i,k)=0;
        L(i,k)=q/p;
        for j=k+1:n
            U(i,j)=U(i,j)-(U(k,j)/q)*p;
        end
    end
end
end