clf;
%DH modeling modified 
a0=0;
alpha0=0;
d1=250;

a1=0;
alpha1=pi/2;
d2=0;

a2=250;
alpha2=0;
d3=0;

a3=175;
alpha3=0;
d4=0;

a4=250;
theta5=0;
alpha4=-pi/2;


L(1)=Link('d',d1,'a',0,'alpha',0,'qlim',[-pi,pi],'modified');
L(2)=Link('d',0,'a',a1,'alpha',alpha1,'qlim',[-pi/2,pi/2],'modified');
L(3)=Link('d',0,'a',a2,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
L(4)=Link('d',0,'a',a3,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
L(5)=Link('d',0,'a',a4,'alpha',0,'qlim',[-pi/2,pi/2],'modified');

robot1=SerialLink(L,'name','huixing');

t1l=-60;
t1h=60;
t2l=-60;
t2h=150;
t3l=0;
t3h=150;


for i=1:10000

 theta1=t1l*pi/180+(t1h-t1l)*pi/180*rand;
 %theta1=0;
 theta2=t2l*pi/180+ (t2h-t2l)*pi/180*rand;
 theta3=t3l*pi/180+(t3h-t3l)*pi/180*rand;
 theta4=-(theta2+theta3);
 
 c1=cos(theta1);
 c2=cos(theta2);
 c3=cos(theta3);
 c4=cos(theta4);
 s1=sin(theta1);
 s2=sin(theta2);
 s3=sin(theta3);
 s4=sin(theta4);

XX(i)=250*c1*c2 + 250*c4*(c1*c2*c3 - c1*s2*s3) - 250*s4*(c1*c2*s3 + c1*c3*s2) + 175*c1*c2*c3 - 175*c1*s2*s3;
YY(i)=250*c2*s1 + 250*c4*(c2*c3*s1 - s1*s2*s3) - 250*s4*(c2*s1*s3 + c3*s1*s2) + 175*c2*c3*s1 - 175*s1*s2*s3;
ZZ(i)=250*s2 + 175*c2*s3 + 175*c3*s2 + 250*c4*(c2*s3 + c3*s2) + 250*s4*(c2*c3 - s2*s3) + 250;
 
end
figure(2);
robot1.plot([0 0 0 0 0]);
hold on;
plot3(XX,YY,ZZ,'r.');