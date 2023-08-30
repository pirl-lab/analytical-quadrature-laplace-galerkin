function I=I2sm(a1,a2,e2,h3,h4)

function F=F3(x,y)
    P1=x*a1(1)+y*a2(1)+e2(1);
    P2=x*a1(2)+y*a2(2)+e2(2);
    P3=x*a1(3)+y*a2(3)+e2(3);
    P=sqrt(P1.*P1+P2.*P2+P3.*P3);
   
    if h4==0 && h3==0
        F=1./(6*P);
    elseif h4==0
        R3=sqrt(P.*P+h3*h3);
        F=(P.*R3-h3*h3*log((P+R3)/h3))./(6*P.^3);
    elseif h3==0
        R4=sqrt(P.*P+h4*h4);
        F=(P.*R4-3*h4*h4*log((P+R4)/h4)+4*h4*h4*(R4-h4)./P)./(6*P.^3);
    end
end

xmin=0; xmax=1; ymin=0; ymax=1;

I=integral2(@F3,xmin,xmax,ymin,ymax);

end
