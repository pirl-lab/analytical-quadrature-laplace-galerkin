function I=I0d(P,h1,h2,h3,h4)

H=[h1 h2 h3 h4];
[~,perm]=sort(H);
H(perm(1))=0; H(perm(2))=0;
h1=H(1); h2=H(2); h3=H(3); h4=H(4);
% 
% cas=getcase(h1,h2,h3,h4);
% if cases(cas)==0
%     cases(cas)=1;
%     fprintf('cas # %i \n',cas);
% end

%fprintf('double: h1 = %e  h2 = %e  h3 = %e  h4 = %e \n',h1,h2,h3,h4);
zerotol=1e-14;
zero2=zerotol*zerotol;
hh=h1*h1+h2*h2+h4*h4;
R=sqrt(P*P+hh);
Phi1=0.5*log((P+R)*(P+R)/hh)/P;
R1=sqrt(P*P+h1*h1);

if h2*h2<zero2*hh
    if P==0
        Phi2=h1/(hh+h4*R);
    else
        Phi2=atan(h1*P/(hh+h4*R))/P;
    end
    Phi3=1/R1*log((R1+R)/h4);
    I=(Phi1+(h1*h1-h4*h4)/(2*h1*h4)*Phi2-Phi3+0.5/(R+h4))/(h1*h1);
elseif h1*h1<zero2*hh
    h=sqrt(hh); R2=sqrt(P*P+h2*h2);
    Phi2=atan(h2*P/(hh+h4*R))/P;
    Phi4=h4*h4/(h2*P*P)*((R2/h2*log((R2+R)/h4)-log((h2+h)/h4)));
    I=(-Phi1+h4/h2*Phi2+h2*h2/(h4*h4)*Phi4-(R2*R2/(R+h4)-h2*h2/(h+h4))/(P*P))/(h2*h2);
else
    disp('I0 executed a prohibited option')
    I=0;
    fprintf('h1 = %e  h2 = %e  h3 = %e  h4 = %e \n',h1,h2,h3,h4);
    stop
end

if isnan(I) || isinf(I)
    fprintf('NaN or inf');
end
