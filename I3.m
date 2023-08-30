function I=I3(a1,a2,a3,e3,h4)

%I=I3m(a1,a2,a3,e3,h4);

zerotol=1e-14;
I=0;

a=zeros(3,3); a(1,:)=a1; a(2,:)=a2; a(3,:)=a3;
[s01,h31]=expan_GrammSchmidt(a,e3);
e3x1=s01(1)*a(1,:)+s01(2)*a(2,:)+s01(3)*a(3,:);
s0=s01; h3=h31; e3x=e3x1;

% %determine projections of e3
% s0=zeros(3,1); Mx=zeros(3,3);
% Mx(1,2)=dot(a1,a2); Mx(1,3)=dot(a1,a3); Mx(2,3)=dot(a2,a3);
% Mx=diag([dot(a1,a1) dot(a2,a2) dot(a3,a3)])+Mx+Mx';
% rhs=[dot(a1,e3) dot(a2,e3) dot(a3,e3)]';
% r=rank(Mx);
% 
% if r==3
%     s0=Mx\rhs;
%     h3=0;
%     e3x=e3;
% elseif r==2
%     n3=cross(a1,a2); n1=cross(a2,a3); n2=cross(a3,a1);
%     %[~,argmn]=min([norm(n1) norm(n2) norm(n3)]);
%     [~,argmx]=max([norm(n1) norm(n2) norm(n3)]);
%     if argmx==1
%         n=n1/norm(n1);
%         e3p=n*dot(e3,n); e3x=-cross(n,cross(n,e3));
%         h3=norm(e3p);
%         rhs=[dot(a2,e3x) dot(a3,e3x)]';
%         s0(2:3)=Mx(2:3,2:3)\rhs;  
%     elseif argmx==2
%         n=n2/norm(n2);
%         e3p=n*dot(e3,n); e3x=-cross(n,cross(n,e3));
%         h3=norm(e3p);
%         rhs=[dot(a1,e3x) dot(a3,e3x)]';
%         s0([1 3])=Mx([1 3],[1 3])\rhs;   
%     elseif argmx==3
%         n=n2/norm(n2);
%         e3p=n*dot(e3,n); e3x=-cross(n,cross(n,e3));
%         h3=norm(e3p);
%         rhs=[dot(a1,e3x) dot(a2,e3x)]';
%         s0(1:2)=Mx(1:2,1:2)\rhs;   
%     end
%     %end
% %     if arg==1 || arg==2
% %         n=n3/norm(n3);
% %         e3p=n*dot(e3,n); e3x=-cross(n,cross(n,e3));
% %         h3=norm(e3p);
% %         rhs=[dot(a1,e3x) dot(a2,e3x)]';
% %         s0(1:2)=Mx(1:2,1:2)\rhs;
% %     else
% %         n=n1/norm(n1);
% %         e3p=n*dot(e3,n); e3x=-cross(n,cross(n,e3));
% %         h3=norm(e3p);
% %         rhs=[dot(a2,e3x) dot(a3,e3x)]';
% %         s0(2:3)=Mx(2:3,2:3)\rhs;
% %     end
%     if h3<zerotol*norm(e3) || norm(e3)==0
%         h3=0;
%     end
% else
%     disp('Anomalous degeneration of sys matrix in I3, rank<2')
%     return
% end

if abs(1+s0(1)+s0(2))>zerotol
    I=I+(1+s0(1)+s0(2))*I2s(a1-a2,a3,e3x+a2,h3,h4);
end
if abs(s0(1))>zerotol
    I=I-s0(1)*I2s(a2,a3,e3x,h3,h4);
end
if abs(s0(2))>zerotol
    I=I-s0(2)*I2s(a1,a3,e3x,h3,h4);
end
if abs(1+s0(3))>zerotol
    I=I+(1+s0(3))*I2t(a1,a2,e3x+a3,h3,h4);
end
if abs(s0(3))>zerotol
    I=I-s0(3)*I2t(a1,a2,e3x,h3,h4);
end
