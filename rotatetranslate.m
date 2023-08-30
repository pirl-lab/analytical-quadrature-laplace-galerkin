function [y1,y2,y3]=rotatetranslate(x1,x2,x3,alpha,beta,gamma,trans)
y1=EulerRot(x1',alpha,beta,gamma);
y2=EulerRot(x2',alpha,beta,gamma);
y3=EulerRot(x3',alpha,beta,gamma);
y1=y1'+trans;
y2=y2'+trans;
y3=y3'+trans;