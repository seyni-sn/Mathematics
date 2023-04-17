a=0;
b=0;
Ti=0;
Tf=1;
N=10;
M=5;
alfa=0;
betta=0;
[h,x]=maillage(a,b,N);
[k,t]=maillage(a,b,M);
A=zeros(N-1,N-1);
for i=1:N-1
    A(i,i)=(1/k+2/h^2);
end
for i=1:N-2
    A(i,i+1)=-1/h^2;
    A(i+1,i)=-1/h^2;
end
U=zeros(N+1,M+1);
%C-L
for j=1:M+1
    U(1,j)=alfa;
    U(N+1,j)=betta;
end
%C-I
for i=1:N+1
    U(i,1)=Uo(x(i));
end

for j=2:M+1
    %calcule de B
    B(1)=ft(x(2),t(j))+(1/k)*U(2,j-1)+(1/h^2)*U(1,j);
    B(N-1)=ft(x(N),t(j))+(1/k)*U(N,j-1)+(1/h^2)*U(N+1,j);
    for i=2:N-2
        B(i)=ft(x(i+1),t(j))+(1/k)*U(i+1,j-1);
    end
    %Resolution
    V=inv(A).*B;
    %Resolution dans U
    for i=2:N
        U(i,j)=V(i-1);
    end
end

for j=1:M+1
 plot(U(:,j));
 hold on
end
    

    