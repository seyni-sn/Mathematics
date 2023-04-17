a=0;
b=1;
ti=0;
tf=1;
alfa=0;
betta=0;
n=10;
m=201;
[h,x]=maillage(a,b,n);
[k,t]=maillage(ti,tf,m);
%initialisation de u
u=zeros(n+1,m+1);
%condition limite
for j=1:m+1
    u(1,j)=alfa;
    u(n+1,j)=betta;
end
  %condition initiale
  for i=1:n+1
      u(i,1)=Uo(x(i));
  end
  for j=1:m
      for i=2:n
      u(i,j+1)=(1-2*(k/h^2))*u(i,j)+(k/h^2)*u(i+1,j)+(k/h^2)*u(i-1,j)+k*ft(x(i),t(j));
      end
  end
  
%on fixe le temps
%jo=2;
%plot(u(:,jo));
for j=1:m+1
 plot(u(:,j));
 hold on
end

    

