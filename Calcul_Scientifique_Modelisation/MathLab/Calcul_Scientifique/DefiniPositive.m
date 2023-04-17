function DefiniPositive(A)
n=size(A,1);
i=1;
for i=1:n
test=det(A(1:i,1:i));
if(test<0)
    break;
end
end
if(i==n)
    disp('La matrice est definei positive');
else
    disp('La matrice n''est pas definie positive');
end
end
    