function I=I2t(a1,a2,e2,h3,h4)

%I=I2tm(a1,a2,e2,h3,h4);

zerotol=1e-14;

a=zeros(2,3); a(1,:)=a1; a(2,:)=a2; 
[s01,h21]=expan_GrammSchmidt(a,e2);
e2x1=s01(1)*a(1,:)+s01(2)*a(2,:);
s0=s01; h2=h21; e2x=e2x1;

% %determine projections of e2
% na1=norm(a1);
% s0=zeros(2,1); Mx=zeros(2,2);
% n1=cross(a1,a2);
% if abs(n1)<zerotol*na1*norm(a2)
%     s0(1)=dot(e2,a1)/(na1*na1);
%     e2x=a1*s0(1);
%     e2p=e2-e2x;    
% else
%     n=n1/norm(n1);
%     e2p=n*dot(e2,n); e2x=-cross(n,cross(n,e2));
%     Mx(1,1)=dot(a1,a1); Mx(1,2)=dot(a1,a2); Mx(2,1)=Mx(1,2); Mx(2,2)=dot(a2,a2);
%     rhs=[dot(e2x,a1) dot(e2x,a2)]';
%     s0=Mx\rhs;
% end
% 
% h2=norm(e2p);
% if h2<zerotol*norm(e2) || norm(e2)==0
%     h2=0;
% end

I=0;
if abs(s0(1))>zerotol
    I=I-s0(1)*I1(a2,e2x,h2,h3,h4);
end
if abs(s0(2))>zerotol
    I=I-s0(2)*I1(a1,e2x,h2,h3,h4);
end
if abs(1+s0(1)+s0(2))>zerotol
    I=I+(1+s0(1)+s0(2))*I1(a1-a2,e2x+a2,h2,h3,h4);
end    
