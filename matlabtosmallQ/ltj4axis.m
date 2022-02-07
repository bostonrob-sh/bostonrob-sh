function thetapT=ltj4axis(X,Y,Z,X1,Y1,Z1)

delta=100;

deltaX=(X1-X)/delta;
deltaY=(Y1-Y)/delta;
deltaZ=(Z1-Z)/delta;

%%DH
d1=250;
alpha1=pi/2;
a2=250;
a3=175;
a4=250;
%%%%%%%%%%%%%%%%%%%%%%%%draw
L(1)=Link('d',d1,'a',0,'alpha',0,'qlim',[-pi,pi],'modified');
L(2)=Link('d',0,'a',0,'alpha',alpha1,'qlim',[-pi/2,pi/2],'modified');
L(3)=Link('d',0,'a',a2,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
L(4)=Link('d',0,'a',a3,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
L(5)=Link('d',0,'a',a4,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
robot1=SerialLink(L);
%%%%%%%%%%%%%%%%%%%%%%%%%


for i=1:100
    XX(i)=X+i*deltaX;
    YY(i)=Y+i*deltaY
    ZZ(i)=Z+i*deltaZ;
    thetap=ik4axis(XX(i),YY(i),ZZ(i));
    thetaT(i,1)=thetap(1);
    thetaT(i,2)=thetap(2);
    thetaT(i,3)=thetap(3);
    thetaT(i,4)=thetap(4);
%     robot1.plot([thetaT(i,1)*pi/180,thetaT(i,2)*pi/180,thetaT(i,3)*pi/180,thetaT(i,4)*pi/180,0])
end 



 figure(1);
 plot3(XX,YY,ZZ,'b','Linewidth',2);
 hold on;
 for i=1:100
    robot1.plot([thetaT(i,1)*pi/180,thetaT(i,2)*pi/180,thetaT(i,3)*pi/180,thetaT(i,4)*pi/180,0])
 end 
end
