function [dt,invers] =DetInv(M)
    if det(M)==0 then
        error("Matrice non inversible");
        dt=det(M);
    else
        dt=det(M);
        invers=inv(M);
    end
endfunction
