function[X,I]=Relaxation(A,b,k,X0,eps)
if(k==0)
    disp('Division par zero donner un entier differant de zero');
else
D=diag(diag(A));
E=D-tril(A);
F=D-triu(A);
M=D/k-E;
N=((1-k)/k)*D +F;
R=N*(inv(M));
r=max(abs(epec(A)));
if(r>1)
    disp('La methode de relaxation ne converge pas pour cette matrice');
else if(r==1)
        disp('On ne peut ppas se prononcer sur la converge de la methode de relaxation pour cette matrice');
    else
        X1=R*X0+(inv(M))*b;
        I=1;
        while(abs(X1-X0)>eps)
            X0=X1;
            X1=R*X0+(inv(M))*b;
            I=I+1;
        end
    end
end
X=X1;
fprintf('La methode converge apres %d iteration',I);
end
end



            
        