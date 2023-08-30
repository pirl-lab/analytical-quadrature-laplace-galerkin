function I=I3m(a1,a2,a3,e3,h4)

function F=F4(x,y,z)
    P1=x*a1(1)+y*a2(1)+z*a3(1)+e3(1);
    P2=x*a1(2)+y*a2(2)+z*a3(2)+e3(2);
    P3=x*a1(3)+y*a2(3)+z*a3(3)+e3(3);
    P=P1.*P1+P2.*P2+P3.*P3;
    F=((P-2*h4*h4).*sqrt(P+h4*h4)+2*h4*h4*h4)./(3*P.*P);
end

xmin=0; xmax=1; zmin=0; zmax=1; ymin=0;
ymax=@(x) 1-x;

%I=integral3(@F4,xmin,xmax,ymin,ymax,zmin,zmax);
I=integral3(@F4,xmin,xmax,ymin,ymax,zmin,zmax,'AbsTol',0,'RelTol',1e-9);

end
