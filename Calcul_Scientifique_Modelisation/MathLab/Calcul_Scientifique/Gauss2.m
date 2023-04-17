function [ x ] = Gauss2( nomfonct,M,b )
n=length(b);
    for i=1:n-1
        for j=i+1:n
            c=M(i+1,j);
            M(i+1,j)=c -(M(i+1,i)*M(i,j))/M(i,i);
        end
        d= b(i+1);
        b(i+1)=d-(M(i+1,i)*b(i)/M(i,i);
    end
x=nomfonct(M,b);

end

