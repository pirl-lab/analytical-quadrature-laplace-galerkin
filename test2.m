%test2
global swi
ep1min=10; ep1max=1e12; neps=200;
ep1=logspace(log10(ep1min),log10(ep1max),neps);
epsi=1./ep1;
x1=[0 0 0]; x2=[1 0 0]; x3=[0.5 sqrt(3)/2 0];
y1=x2; y2=x1; y3=x3;

Ms=zeros(neps,1); swit=zeros(neps,1);

for i=1:neps
    eps=epsi(i);
    y1(3)=eps; y2(3)=eps;
    [~,Ms(i)]=GalerkinLaplaceTriGS(x1,x2,x3,y1,y2,y3);
    swit(i)=swi;
end


