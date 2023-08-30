function [L,M,N,Lpx,Lpy,Lpz]=GalerkinMxAn(faces,vertices)
%function [L,M,N,Lpx,Lpy,Lpz,Mpx,Mpy,Mpz]=GalerkinMxAn(faces,vertices)
global cases

cases=zeros(8,1);

nf=size(faces,1);
L=zeros(nf,nf); M=zeros(nf,nf); N=zeros(nf,nf);
Lpx=zeros(nf,nf); Lpy=zeros(nf,nf); Lpz=zeros(nf,nf);
%Mpx=zeros(nf,nf); Mpy=zeros(nf,nf); Mpz=zeros(nf,nf);

v1=vertices(faces(:,1),:);
v2=vertices(faces(:,2),:);
v3=vertices(faces(:,3),:);

%fnei=[1 2 3 4 41 43 44 2439 3961 3962 3964];

for i=1:nf
    x1=v1(i,:); x2=v2(i,:); x3=v3(i,:);
    fprintf('i = %i \n',i);
    for j=1:1 %i:nf
        y1=v1(j,:); y2=v2(j,:); y3=v3(j,:);
        fprintf('i = %i  j = %i \n',i,j);
        [L0,M0,N0,Lp0]=GalerkinLaplaceTriGS(x1,x2,x3,y1,y2,y3);
%         [L1,M1,N1,Lp1]=GalerkinLaplaceTriGS(x1,x2,x3,y1,y2,y3);
%         if numel(intersect(i,fnei))==0
%             [L0,M0,N0,Lp0]=GalerkinLaplaceTriNum(x1,x2,x3,y1,y2,y3);
%             err=abs(L1-L0)/(4*pi*0.001064348321048)
%         else
%             L0=L1; M0=M1; N0=N1; Lp0=Lp1;
%         end
        L(j,i)=L0;
        M(j,i)=M0;
        N(j,i)=N0;
        Lpx(j,i)=Lp0(1); Lpy(j,i)=Lp0(2); Lpz(j,i)=Lp0(3);
        %Mpx(j,i)=Mp0(1); Mpy(j,i)=Mp0(2); Mpz(j,i)=Mp0(3);
    end
end
        