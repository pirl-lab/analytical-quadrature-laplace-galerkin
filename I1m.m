function I=I1m(a1,e1,h2,h3,h4)

function F=F2(x)
    P1=x*a1(1)+e1(1);
    P2=x*a1(2)+e1(2);
    P3=x*a1(3)+e1(3);
    P=sqrt(P1.*P1+P2.*P2+P3.*P3);
    h23=sqrt(h2*h2+h3*h3);
    if h4==0 && h3==0 && h2==0
        F=1./(6*P);
    elseif h4==0 && h3==0
        R2=sqrt(P.*P+h2*h2);
        F=(R2-h2)./(6*P.*P);
    elseif h4==0 && h2==0
        R3=sqrt(P.*P+h3*h3);
        F=(R3+h3*h3./P.*log((P+R3)/h3))./(6*P.*P);
    elseif h3==0 && h2==0
        R4=sqrt(P.*P+h4*h4);
        F=(R4-3*h4+h4*h4*(3./P.*log((P+R4)/h4)-2*(R4-h4)./(P.*P)))./(6*P.*P);
    elseif h4==0
        R2=sqrt(P.*P+h2*h2);
        R3=sqrt(P.*P+h2*h2+h3*h3);
        F=(R3-h23-h3*h3/h2*log((h2+h23)/h3)+h3*h3./R2.*log((R2+R3)/h3))./(6*P.*P);
    elseif h3==0
        h=sqrt(h2*h2+h4*h4);
        R2=sqrt(P.*P+h2*h2);
        R4=sqrt(P.*P+h*h);
        F=(R4-h+h4*h4*(3./R2.*log((R2+R4)/h4)-3/h2*log((h2+h)/h4)-2*(R4-h4)./(R2.*R2)+2*(h-h4)/(h2*h2)))./(6*P.*P);
    end
end

xmin=0; xmax=1;

I=integral(@F2,xmin,xmax); %,'Abs',0,'RelTol',5e-7);

end
