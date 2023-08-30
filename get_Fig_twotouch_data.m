function get_Fig_twotouch_data
ep1min=10; ep1max=1e8; neps=100;
ep1=logspace(log10(ep1min),log10(ep1max),neps);
epsi=1./ep1;
x1=[0 0 0]; x2=[1 0 0]; x3=[0.5 sqrt(3)/2 0];
y1=[0 0 0]; y2=[1 0 0]; y3=[0.5 0 sqrt(3)/2];  

Ne=2*(log(2*ep1)-1);
%N0=6*log(3); 

%Ne1=6*log(ep1);
[L01,M01,N01]=GalerkinLaplaceTriGS(x1,x2,x3,y1,y2,y3);
N0=N01;

Ntheor=N0-Ne;
Ltheor=L01;
Mtheor=M01;

errL=zeros(size(ep1));
errM=errL; errN=errL;

for i=1:neps
    eps=epsi(i);
    y11=y1+[0 0 eps]; y22=y2+[0 0 eps]; y33=y3+[0 0 eps];
    [L,M,N]=GalerkinLaplaceTriGS(x1,x2,x3,y11,y22,y33);
    errL(i)=abs(L/Ltheor-1);
    errM(i)=abs(M/Mtheor-1);
    errN(i)=abs(N/Ntheor(i)-1);
%     errL(i)=abs(L-Ltheor);
%     errM(i)=abs(M);
%     errN(i)=abs(N-Ntheor(i));
%     if i>90
%         fprintf('eps = %e  M/Mtheor = %f \n',eps,M/Mtheor);
%     end
end

save Fig_twotouch_data ep1 epsi errL errM errN
