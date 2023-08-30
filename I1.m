function I=I1(a1,e1,h2,h3,h4)

%I=I1m(a1,e1,h2,h3,h4);

zerotol=1e-14;
 
[s01,h11]=expan_GrammSchmidt(a1,e1);
e1x1=s01*a1(1,:);
s0=s01; h1=h11; e1x=e1x1;
na1=norm(a1);

% 
% %determine projections of e1
% na1=norm(a1);
% s0=dot(e1,a1)/(na1*na1);
% e1x=a1*s0(1);
% e1p=e1-e1x;
% 
% h1=norm(e1p);
% if h1<zerotol*na1 || na1==0
%     h1=0;
% end

I=0;
if abs(1+s0)>zerotol
    I=I+(1+s0)*I0(abs(1+s0)*na1,h1,h2,h3,h4);
end
if abs(s0)>zerotol
    I=I-s0*I0(abs(s0)*na1,h1,h2,h3,h4);
end
