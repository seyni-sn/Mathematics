function[lmda]=RecherchLamda(X,Y,k)
if(k==1)
    lmda=Y(1);
%else if(k==2) lmda=(Y(2)-Y(1))/(X(2)-X(1));
 %   end
else
    q=X(k)-X(1);
    s=0;
    %Z(k)=(Y(k)-Y(k-1))/(X(k)-X(k-1));
    s=s+(Y(k)-Y(k-1))/(X(k)-X(k-1));
    for i=2:k-1
        %Z(i)=(Y(i)-Y(i-1))/(X(i)-X(i-1));
         s=s+(Y(i)-Y(i-1))/(X(i)-X(i-1));
    end
    lmda=s/q;
end
end
        