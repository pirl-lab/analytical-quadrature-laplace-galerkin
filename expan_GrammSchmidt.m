function [s0,h]=expan_GrammSchmidt(a,e)
[dim,~]=size(a);
s0=zeros(dim,1);
u=zeros(size(a)); un2=zeros(dim,1); c=zeros(dim,dim);
u(1,:)=a(1,:); 
un2(1)=dot(u(1,:),u(1,:));
%c(1,1)=1; 
if dim>1
    c(1,2)=dot(u(1,:),a(2,:))/un2(1);
    u(2,:)=a(2,:)-c(1,2)*u(1,:);
    un2(2)=dot(u(2,:),u(2,:));
    if un2(2)==0
        u(2,:)=0; un2(2)=1;
    end
    c(2,2)=dot(u(2,:),a(2,:))/un2(2);
    if dim>2
        c(1,3)=dot(u(1,:),a(3,:))/un2(1);
        c(2,3)=dot(u(2,:),a(3,:))/un2(2);
        u(3,:)=a(3,:)-c(1,3)*u(1,:)-c(2,3)*u(2,:);
        un2(3)=dot(u(3,:),u(3,:));
        if un2(3)==0
            u(3,:)=0; un2(3)=1;
        end
        c(3,3)=dot(u(3,:),a(3,:))/un2(3);
        if dim>3
            c(1,4)=dot(u(1,:),a(4,:))/un2(1);
            c(2,4)=dot(u(2,:),a(4,:))/un2(2);
            c(3,4)=dot(u(3,:),a(4,:))/un2(3);
            u(4,:)=a(4,:)-c(1,4)*u(1,:)-c(2,4)*u(2,:)-c(3,4)*u(3,:);
            un2(4)=dot(u(4,:),u(4,:));
            if un2(4)==0
                u(4,:)=0; un2(4)=1;
            end
            c(4,4)=dot(u(4,:),a(4,:))/un2(4);
        end
    end
end

res=zeros(dim,1);
epar=zeros(1,3);

if dim>3
    if c(4,4)~=0
        s0(4)=dot(e,u(4,:))/(c(4,4)*un2(4));
        res(3)=s0(4)*c(3,4)*un2(3);
        res(2)=s0(4)*c(2,4)*un2(2);
        res(1)=s0(4)*c(1,4)*un2(1);
        epar=s0(4)*a(4,:);
    end
end
if dim>2
    if c(3,3)~=0
        s0(3)=(dot(e,u(3,:))-res(3))/(c(3,3)*un2(3));
        res(2)=res(2)+s0(3)*c(2,3)*un2(2);
        res(1)=res(1)+s0(3)*c(1,3)*un2(1);
        epar=epar+s0(3)*a(3,:);
    end
end
if dim>1
    if c(2,2)~=0
        s0(2)=(dot(e,u(2,:))-res(2))/(c(2,2)*un2(2));
        res(1)=res(1)+s0(2)*c(1,2)*un2(1);
        epar=epar+s0(2)*a(2,:);
    end
end
s0(1)=(dot(e,u(1,:))-res(1))/un2(1);
epar=epar+s0(1)*a(1,:);
h=norm(e-epar);