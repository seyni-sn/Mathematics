function[X]=Decente(L,b)
    if(tril(L)!=L) then
        error("Cette methode ne s''applique qu''au matrice triangulaire inferieure");
    else
        n=rank
    X(1)=b(1)/L(1,1);
    for i=2:n
        s=0;
        for j=1:i-1
            s=s+L(i,j)*X(i);
        end
        X(i)=(b(i)-s)/L(i,j);
    end
end if
    endfunction
