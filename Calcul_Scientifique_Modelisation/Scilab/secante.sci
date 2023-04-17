function [s,i]=secante(a,b,e,f)
    if (f(a)*f(b)>0) then mprintf("il n''y pas de solution dans cet intervalle")
        pause;
    exit(-1);
    else 
        x0=a;i=0;x1=(x0*f(b)-b*f(x0))/(f(b)-f(x0))
    while(abs(x1-x0)>e),x0=x1
        x1=(x0*f(b)-b*f(x0))/(f(b)-f(x0))
        i=i+1;
    end
     s=x1
    end
endfunction
function [y]=f(x)
    y=x^2-2
endfunction
