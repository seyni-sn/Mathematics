a=0;
b=1;
xo=1;
eps=0.01;
x1=xo-fs(xo)/fsd(xo);
X=0:0.1:1;
Z=zeros(11,1);
for i=1:11
    y(i)=fs(X(i));
end
for i=1:11
    tg1(i)=tang(X(i),xo);
end
plot(X,Z,'-k');
plot(X,y);
hold on
plot(X,tg1,':g');
while((abs(x1-xo))>eps)
    xo=x1;
    x1=xo-fs(xo)/fsd(xo);
end
for i=1:11
    tg2(i)=tang(X(i),xo);
end
plot(X,tg2,'-rd');
plot(X1,y1,'*');
    
    