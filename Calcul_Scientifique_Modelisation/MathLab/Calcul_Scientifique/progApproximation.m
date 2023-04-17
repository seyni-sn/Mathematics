y=[9.14 8.14 8.74 8.77 9.26 8.10 6.13 3.10 9.13 7.26 4.74]';
x=[10 8 13 9 11 14 6 4 12 7 5]';
m=10;
[ A,b,P] = Approximation( x,y,m );
[ m1,m2] = minMax( x );
xx=m1:0.1:m2;
z=0;
for i=1:m+1
    z=z+P(i).*xx.^(i-1);
end
yn=zeros(length(x));
%interpolation newton
for i=1:length(x)
yn(i)=PolynomeNewton(x(i),x,y);
end
%interpolation lagrange
yl=zeros(length(x));
for i=1:length(x)
yl(i)=PolynomeLagrange(x(i),x,y);
end
plot(x,y,'*');
hold on
plot(xx,z,'k');
hold on
plot(x,yn,'-*');
hold on
plot(x,yl,':rd');
    