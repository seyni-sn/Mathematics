function [s,i]=newton(a,b,x0,e,f,fp)
    i=0;
    if (f(a)*f(b)>0) then mprintf("il n''y pas de solution dans cet intervalle")
        pause;
        exit(-1);
    else 
        x1=x0-f(x0)/fp(x0);
    while (abs(x1-x0)>e),x0=x1;
        x1=x0-f(x0)/fp(x0);
        i=i+1
    end
    end
    s=x1
endfunction
function [y]=f(x)
    y=x^2-2
endfunction
function [y]=fp(x)
    y=2*x
endfunction
