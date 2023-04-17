function [y]=JORDAN(a,b,pivot)
    n=sqrt(length(a));// on calcule l'ordre de la matrice
    c1=ones(n,n);c2=ones(n,n);d1=c1(:,n);d2=d1;
    [c1,d1]=pivot(a,b)//premier transformation en mat sup
    [c2,d2]=pivot(c1,d1)//deuxieme transformation en mat diag
    for i=1:n
        I(i,i)=c2(i,i)/c2(i,i);// 3 eme transformation en mat identite
        bf(i)=d2(i)/c2(i,i)// enfin transformation de b en la solution 
    end
    x=bf;
endfunction
function [c,d]=pivot(a,b)
    a1=a;b1=b;
    n=sqrt(length(a));
    a2=ones(n,n);b2=a(:,n);
    for k=1:n 
        for i=k+1:n
            for j=k+1:n
              if (i<k+1) then// consevation des k 1ere lingnes
               a2(i,:)=a1(i,:);
              end
             if ((j>0)&(j<k+1)) then//consevation des k-1 1ere colones
              a2(:,j)=a1(:,j)
             end
            end
            a2(i,j)=(a1(i,j)-a1(i,k)/a1(k,k));
            b2(i)=(b1(i)-(a1(i,k)/a1(k,k))*b1(k));
        end
        a1=a2;b1=b2;
    end
    c=a1;d=b1;
endfunction
