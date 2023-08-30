function xr=EulerRot(x,alpha,beta,gamma)
Q1=eye(3,3); Q2=eye(3,3); Q3=eye(3,3);
Q1(1,1)=cos(alpha); Q1(1,2)=-sin(alpha); Q1(2,1)=-Q1(1,2); Q1(2,2)=Q1(1,1);
Q2(1,1)=cos(beta); Q2(1,3)=sin(beta); Q2(3,1)=-Q2(1,3); Q2(3,3)=Q2(1,1);
Q3(1,1)=cos(gamma); Q3(1,2)=-sin(gamma); Q3(2,1)=-Q3(1,2); Q3(2,2)=Q3(1,1);
xr=Q3*(Q2*(Q1*x));