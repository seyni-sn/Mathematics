function [y]=f(x)
    y=x^2-2
endfunction
function[s,n]=dichotomie(f,a,b,e)
    if (f(a)*f(b)>0) then mprintf("pas de solution dans cet intervalle!!")
        return;
        else
         a0=a;
    b0=b; 
    n=0;
    while (b0-a0)>e,p=(a0+b0)/2
        if f(a0)*f(p)<0 then b0=p;
            else a0=p;
        end
        n=n+1;  s=p;
    end
    end
endfunction
function [y]=fp(x)
    y=2*x
endfunction

 
