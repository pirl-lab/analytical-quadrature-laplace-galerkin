%TestSalle
h=[0 1e-4 1e-3 1e-2 1e-1 1];
I=[0.4154834934268203 0.4154834087866362 0.4154773308369880 0.4150963397038615 0.3986731498732934 0.1994877345160992];
J2=[0.093721025118638 -0.006966866801592 -0.000628936995127];

nh=length(h);
I0=zeros(nh,1);

x1=[0 0 0]; x2=[0 1 0]; x3=[1 0 0];
y1=[0 0 0]; y2=[0 1 0]; y3=[-1 0 0];
zh=[0 0 1];

for i=1:nh
    L=GalerkinLaplaceTriGS(x1,x2,x3,y1+h(i)*zh,y2+h(i)*zh,y3+h(i)*zh);
    I0(i)=L;
%     eps=L-I(i);
%     fprintf('h = %2.1e \t I = %17.16f \t L = %17.16f \t eps = %e \n',h(i), I(i),I0(i),eps);
end

y1=[-2 0.5 0.01]; y2=[-1 1 0.01]; y3=[-1 0 0.01];
[~,~,~,Lp]=GalerkinLaplaceTriGS(x1,x2,x3,y1,y2,y3);


for i=1:nh
    eps=abs(I0(i)-I(i));
    fprintf('h = %2.1e \t I = %17.16f \t L = %17.16f \t eps = %e \n',h(i), I(i),I0(i),eps);
end

eps=abs(Lp-J2);
h=0.01;
for j=1:3
    fprintf('h = %2.1e \t J2 = %17.16f \t Lp = %17.16f \t eps = %e \n',h, J2(j),Lp(j),eps(j));
end

