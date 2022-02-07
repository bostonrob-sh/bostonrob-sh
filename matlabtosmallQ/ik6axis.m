
%input origin
O=[400.358 338.965 131.506]';
RM=eulerangle(27.9117,36.2245,-166.0719);
R3=[RM(1,3),RM(2,3),RM(3,3)]'

%%parameter
a0=0;
alpha0=0;
d1=250;

a1=0;
alpha1=pi/2;
d2=0;

a2=250;
alpha2=0;
d3=0;

a3=0;
alpha3=pi/2;
d4=250;


a4=0;
alpha4=-pi/2;
d5=0;

a5=0;
alpha5=pi/2;
d6=0;

a6=0;
alpha6=0;
d7=250;

OC=O-d7*R3
% %%inverse theta1 theta2 theta3
% theta3 永远是正的
% %%%%%%%%%%%%%%%%%%%%%%%%%求theta1 和 Xc Yc Zc
X=OC(1);
Y=OC(2);
Z=OC(3);
if Y>=-0.00001&&Y<=0.00001
    theta1=0;
    theta11=0;
else
    theta1=atan2(Y,X);  %% atan2 是以极坐标为初始的（对边比领边）
    theta11=theta1*180/pi;
end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% theta3（rad)
 R=((X)^2+(Y)^2)^0.5;
 S=Z-d1;
 Cos3=((X)^2+(Y)^2+S^2-a2^2-d4^2)/(2*a2*d4);
 if Cos3==0  %90度弯曲
     if S<0
         theta3=-pi/2;
         theta33=theta3*180/pi;
     else
         theta3=pi/2;
         theta33=theta3*180/pi;
     end
 elseif  Cos3>=0.9999&&Cos3<=1.0001  %无任何弯曲
    theta3=0;
    theta33=0;
 else
    theta3=atan2((1-(Cos3)^2)^0.5,Cos3);
    theta33=theta3*180/pi;
 end
 
 %%%%%%%%%%%%%%%%%%%%%theta2
 
 angle3=atan2(d4*sin(theta3),a2+d4*cos(theta3));
 angle33=angle3*180/pi;
 angle2=atan2(S,R);
 angle22=angle2*180/pi;
 theta2=angle2-angle3;
 theta22=theta2*180/pi;
% 
theta=[theta11,theta22,theta33+90];
c1=cos(theta(1)*pi/180);
s1=sin(theta(1)*pi/180);
c2=cos(theta(2)*pi/180);
s2=sin(theta(2)*pi/180);
c3=cos(theta(3)*pi/180);
s3=sin(theta(3)*pi/180);
R01=[c1 -s1 0 ;
        s1 c1 0 ;
        0 0 1 ;
        ];
    
 R12=[c2 -s2 0 ;
        0 0 -1 ;
        s2 c2 0 ;
        ];
    
 R23=[c3 -s3 0 ;
        s3 c3 0 ;
        0 0 1 ;
       ];
R03=R01*R12*R23;
R03T=round(R03');
R36=R03T*RM;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [ c4*c5*c6 - s4*s6, - c6*s4 - c4*c5*s6, c4*s5]
% [            c6*s5,             -s5*s6,   -c5]
% [ c4*s6 + c5*c6*s4,   c4*c6 - c5*s4*s6, s4*s5]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if round(R36(2,3))==-1  %%theta5=0度，S5=0 theta4 6自由决定
    theta5=0;
    theta4=0;
    theta6=atan2(R36(3,1),R36(1,1));
else   %%theta 角度！=0 s5!=0 r31 r33可以 
    theta5=atan2((1-(R36(2,3))^2)^(0.5),-R36(2,3));
    if round(R36(1,3))==1
        theta4=0;
        if round(R36(2,1))==1
            theta6=0;
        else
            theta6=atan2(-R36(2,2),R36(2,1));
        end
    else
        theta4=atan2(R36(3,3),R36(1,3));
        if round(R36(2,1))==1
            theta6=0;
        else
            theta6=atan2(-R36(2,2),R36(2,1));
        end
    end
end

thetaT=[theta1*180/pi,theta2*180/pi,theta3*180/pi+90,theta4*180/pi,theta5*180/pi,theta6*180/pi]
;
L2(1)=Link([0 d1 a0 alpha0],'modified');
L2(2)=Link([0 d2 a1 alpha1],'modified');
L2(3)=Link([0  d3 a2 alpha2],'modified');
L2(4)=Link([0 d4 a3 alpha3 ],'modified');
L2(5)=Link([0 d5 a4 alpha4],'modified');
L2(6)=Link([0 d6 a5 alpha5],'modified');
L2(7)=Link([0 d7 a6 alpha6],'modified');

robot2=SerialLink(L2,'name','xxx');
figure(2);
robot2.plot([theta1,theta2,theta3+pi/2,theta4,theta5,theta6,0])