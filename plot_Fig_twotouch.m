function plot_Fig_twotouch
load('Fig_twotouch_data.mat','ep1','epsi','errL','errM','errN')
%save Fig_hyper_data ep1 epsi errL errM errN

neps=length(ep1);
hf=figure; set(hf,'Color','w');
loglog(ep1(1:3:neps),errL(1:3:neps),'kv');
hold on;
loglog(ep1(1:3:neps),errM(1:3:neps),'ks');
hold on;
loglog(ep1(1:3:neps),errN(1:3:neps),'ko');
xlabel('1/\epsilon'); ylabel('Relative difference')
%xlim([1e1 1e7]);
axis square
A=errL(neps)*ep1(neps);
lin=A./ep1;
loglog(ep1(1:3:length(ep1)),lin(1:3:length(ep1)),'k--');
B=errM(neps)*ep1(neps);
lin=B./ep1;
loglog(ep1(1:3:length(ep1)),lin(1:3:length(ep1)),'k:');
C=errN(neps)*ep1(neps);
C=errN(neps)*ep1(neps)*log(ep1(neps));
linlog=C./(ep1.*log(ep1));
loglog(ep1(1:3:length(ep1)),linlog(1:3:length(ep1)),'k-');
legend('Weakly singular','Singular','Hypersingular','rel diff=A\epsilon','rel diff=B\epsilon','rel diff=C\epsilon/log(\epsilon)')
