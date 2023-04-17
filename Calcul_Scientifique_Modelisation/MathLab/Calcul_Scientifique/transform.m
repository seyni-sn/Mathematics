function [ L,b1 ] = transform( M,b )
n=length(b);
for j=n:-1:1
    for i=j-1:-1:1
        b(i)=b(i)-(M(i,j)/M(j,j))*b(j);
        M(i,:)=M(i,:)-(M(i,j)/M(j,j))*M(j,:);
    end
end
L=M;
b1=b;
end

