function DiaganalDominant(A)
n=size(A,1);
for i=1:n
    test=abs(A(i,i));
for j=1:n
    s=0;
    if(j~=i)
    s=s+A(i,j);
    end  
if(test<=s)
    break;
end
end
end
if(i==n)
    disp('La matrice est a diagonal strictement dominant');
else
    disp('La matrice n''est a diagonal strictement dominant');
end
end