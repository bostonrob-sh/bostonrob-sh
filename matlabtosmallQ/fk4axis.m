function [XX,YY,ZZ]=fk4axis(theta1p,theta2p,theta3p,theta4p)
%syms c1 s1 c2 s2 c3 s3 c4 s4
%get data
% theta1p;
% theta2p;
% theta3p;
% theta4p;

%DH modeling modified 
a0=0;
d1=250;
a2=250;
a3=175;
a4=250;


% L(1)=Link('d',d1,'a',0,'alpha',0,'qlim',[-pi,pi],'modified');
% L(2)=Link('d',0,'a',a1,'alpha',alpha1,'qlim',[-pi/2,pi/2],'modified');
% L(3)=Link('d',0,'a',a2,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
% L(4)=Link('d',0,'a',a3,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
% L(5)=Link('d',0,'a',a4,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
% 
% robot1=SerialLink(L,'name','huixing');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% xx  250*c1*c2 + 175*c1*c2*c3 - 175*c1*s2*s3
% yy  250*c2*s1 + 175*c2*c3*s1 - 175*s1*s2*s3
% zz  250*s2 + 175*c2*s3 + 175*c3*s2 + 250
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q0=[theta1p*pi/180 theta2p*pi/180 theta3p*pi/180 theta4p*pi/180];
c1=cos(theta1p*pi/180);
s1=sin(theta1p*pi/180);
c2=cos(theta2p*pi/180);
s2=sin(theta2p*pi/180);
c3=cos(theta3p*pi/180);
s3=sin(theta3p*pi/180);
c4=cos(theta4p*pi/180);
s4=sin(theta4p*pi/180);
  T01=[c1 -s1 0 a0;
        s1 c1 0 0;
        0 0 1 d1;
        0 0 0 1];
    T12=[c2 -s2 0 0;
        0 0 -1 0;
        s2 c2 0 0;
        0 0 0 1];
    T23=[c3 -s3 0 a2;
        s3 c3 0 0;
        0 0 1 0;
        0 0 0 1];
    T34=[c4 -s4 0 a3;
        s4 c4 0 0;
        0 0 1 0;
        0 0 0 1];
     T45=[c4 -s4 0 a4;
        s4 c4 0 0;
        0 0 1 0;
        0 0 0 1];

    T=T01*T12*T23*T34;
 
    XX=T(1,4)
    YY=T(2,4)
    ZZ=T(3,4)
    
  end