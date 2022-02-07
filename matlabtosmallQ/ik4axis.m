function thetap=ik4axis(X,Y,Z)

%%DH
d1=250;
alpha1=pi/2;
a2=250;
a3=175;
a4=250;

%% inverse 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%求theta1 和Xc Yc Zc
theta1=atan2(Y,X);  %% atan2 是以极坐标为初始的（对边比领边）
theta11=theta1*180/pi;
Xc=abs(X)-abs(cos(theta1)*a4);
Yc=abs(Y)-abs(sin(theta1)*a4);
%%%%%%%%%%%%%%%%%%%%%theta3
 R=((Xc)^2+(Yc)^2)^0.5;
 S=Z-d1;
 Cos3=((Xc)^2+(Yc)^2+S^2-a2^2-a3^2)/(2*a2*a3)
 if Cos3==0  %90度弯曲
     if S<0
         theta3=-pi/2;
         theta33=theta3*180/pi;
     else
         theta3=pi/2;
         theta33=theta3*180/pi;
     end
 elseif  Cos3>=0.95&&Cos3<=1.05  %无任何弯曲
    theta3=0;
    theta33=0;
 elseif Cos3>=-1.05&&Cos3<=-0.95
     theta3=pi;
     theta33=180;
 else
%      if S<0
%         theta3=atan2(-(1-(Cos3)^2)^0.5,Cos3);
%         theta33=theta3*180/pi;
%         
%      else
         theta3=atan2((1-(Cos3)^2)^0.5,Cos3);
         theta33=theta3*180/pi;
%      end
 end
 
 %%%%%%%%%%%%%%%%%%%%%theta2
 angle3=atan2(a3*sin(theta3),a2+a3*cos(theta3));
 angle2=atan2(S,R);
 theta2=angle2-angle3;
 theta22=theta2*180/pi;
 %%%%%%%%%%%%%%%%%%%%%theta4

theta4=-theta2-theta3;
theta44=theta4*180/pi;

theta=[theta1 theta2 theta3 theta4 0];
thetap=[theta11 theta22 theta33 theta44 0]

fk4axis(theta11,theta22,theta33,theta44);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%worksapce
% L(1)=Link('d',d1,'a',0,'alpha',0,'qlim',[-pi,pi],'modified');
% L(2)=Link('d',0,'a',0,'alpha',alpha1,'qlim',[-pi/2,pi/2],'modified');
% L(3)=Link('d',0,'a',a2,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
% L(4)=Link('d',0,'a',a3,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
% L(5)=Link('d',0,'a',a4,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
% 
% robot1=SerialLink(L);
% 
% figure(1);
% robot1.plot([0 0 0 0 0]);
% pause(2);
% robot1.plot(theta);
% hold on;
end
