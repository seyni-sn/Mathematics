a=0;
b=2;
Nmax=10;
Iex=8;
for N=2:Nmax
[h,x]=maillage(a,b,N);
Iapp1=0;
%E1=zeroes(9);
for k=1:N
    Iapp1=Iapp1+f(x(k));
end
Iapp1=h*Iapp1;
E1(N)=abs(Iapp1-Iex);

Iapp2=0;
%E2=0;
for k=1:N
    Iapp2=Iapp2+f(x(k+1));
end
Iapp2=h*Iapp2;
E2(N)=abs(Iapp2-Iex);

Iapp3=0;
%E3=0;
for k=1:N
    Iapp3=Iapp3+f((x(k)+x(k+1))/2);
end
Iapp3=h*Iapp3;
E3(N)=abs(Iapp3-Iex);

Iapp4=0;
%E4=0;
for k=1:N
    Iapp4=Iapp4+f(x(k))+f(x(k+1));
end
Iapp4=(h/2)*Iapp4;
E4(N)=abs(Iapp4-Iex);


Iapp5=0;
%E5=0;
for k=1:N
    Iapp5=Iapp5+f(x(k))+f(x(k+1))+4*f((x(k)+x(k+1))/2);
end
Iapp5=(h/6)*Iapp5;
E5(N)=abs(Iapp5-Iex);
end
X=1:Nmax;
plot(X,E1,'*');
hold on
plot(X,E2,'k');
hold on
plot(X,E3,'-*');
hold on
plot(X,E4,':rd');