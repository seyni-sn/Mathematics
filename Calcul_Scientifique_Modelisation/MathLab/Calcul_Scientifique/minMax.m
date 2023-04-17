function [ m1,m2] = minMax( x )
n=length(x);
m1=x(1);
m2=x(1);
for i=1:n
    if(m1>x(i))
        m1=x(i);
    end
    if(m2<x(i))
        m2=x(i);
    end
end
end

