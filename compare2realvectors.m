function [hf,err2,errinf]=compare2realvectors(veccom,vecref,str)
hf=figure; set(hf,'Color','w');

plot(vecref,veccom,'r.');
hold on;
plot(vecref,vecref);
title(str);

if norm(vecref)~=0
    err2=norm(veccom-vecref)/norm(vecref);
    errinf=max(abs(veccom-vecref))/max(abs(vecref));
    fprintf(str)
    fprintf(': relative  err2 = %e   errinf = %e \n',err2,errinf);
else
    err2=norm(veccom)/length(veccom);
    errinf=max(abs(veccom));
    fprintf(str)
    fprintf(': absolute  err2 = %e   errinf = %e \n',err2,errinf);
end


