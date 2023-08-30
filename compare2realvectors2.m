function [hf,err2]=compare2realvectors2(veccom,vecref,str)
hf=figure; set(hf,'Color','w');

plot(vecref,veccom,'r.');
hold on;
plot(vecref,vecref);
title(str);

if norm(vecref)~=0
    err2=norm(veccom-vecref)/norm(vecref);
    fprintf(str)
    fprintf(': relative  err2 = %e \n',err2);
else
    err2=norm(veccom)/length(veccom);
    fprintf(str)
    fprintf(': absolute  err2 = %e \n',err2);
end


