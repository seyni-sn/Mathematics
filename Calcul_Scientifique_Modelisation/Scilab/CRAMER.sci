 function [x]=CRAMER(a,b)
     x=a(:,1);
    d=det(a); d0=0;
    if (d==0) then//on fait un controle sur det(a) qui ne doit pas etre null
        mprintf("pas de solution avec la methode de CRAMER!")
        pause;
        return;
    else n=sqrt(length(a))
        for i=1:n
             d1=zeros(n,n);
            if  (i==1)then d1=[a(:,i+1:n),b]
                d0=det(d1)
                x(i)=d0/d;
            else d1(:,i:n-1)=a(:,i+1:n)
                d1(:,1:i-1)=a(:,1:i-1);//manupulation pour obtenir une matrice sans la ieme ligne de a
                d1(:,n)=b;//j'afect b a la n ieme de d1
                d0=det(d1);
                 x(i)=d0/d;
            end
        end
    end
endfunction
