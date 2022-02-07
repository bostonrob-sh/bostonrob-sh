clf;
d1=150;
a2=150;
a3=150;

t=10;

%起始点
XX0=280;
YY0=0;
ZZ0=150;
%%中间点位置
XX1=250;
YY1=0;
ZZ1=280;
%终点
XX2=130;
YY2=0;
ZZ2=380;

Xs=[XX0 XX1 XX2];
Ys=[YY0 YY1 YY2];
Zs=[ZZ0 ZZ1 ZZ2];
%% inverse 
%theta1
theta1x=0;
theta1xp=theta1x*180/pi;
Xc1=XX1;
Yc1=YY1;
Zc1=ZZ1;
%theta3（rad)
R1=((Xc1)^2+(Yc1)^2)^0.5;
S1=Zc1-d1;
D1=((Xc1)^2+(Yc1)^2+S1^2-a2^2-a3^2)/(2*a2*a3);
    
    if D1>=0.9999&&D1<=1.0001
        theta3x=0;
        theta3xp=0;
        theta2x=atan2(S1,R1);
        theta2xp=theta22*180/pi;
    else
        theta231=atan2(-(1-D1^2)^0.5,D1);
        theta232=atan2((1-D1^2)^0.5,D1);%op
        angle12=atan2(S1,R1);
        
        angle111=atan2(a3*sin(theta231),(a2+a3*cos(theta231)));
        angle112=atan2(a3*sin(theta232),(a2+a3*cos(theta232)));%op
        theta221=angle12-angle111; %%big
        theta222=angle12-angle112; %%small

            theta2x=theta222;
            theta2xp=theta222*180/pi;
            theta3x=theta232;
            theta3xp=theta232*180/pi
        end 


%% inverse 
%theta1
theta1s=0;
theta1sp=theta1s*180/pi;
Xc1=XX0;
Yc1=YY0;
Zc1=ZZ0;
%theta3（rad)
R1=((Xc1)^2+(Yc1)^2)^0.5;
S1=Zc1-d1;
D1=((Xc1)^2+(Yc1)^2+S1^2-a2^2-a3^2)/(2*a2*a3);
    
    if D1>=0.9999&&D1<=1.0001
        theta3s=0;
        theta3sp=0;
        theta2s=atan2(S1,R1);
        theta2sp=theta22*180/pi;
    else
        theta231=atan2(-(1-D1^2)^0.5,D1);
        theta232=atan2((1-D1^2)^0.5,D1);%op
        angle12=atan2(S1,R1);
        
        angle111=atan2(a3*sin(theta231),(a2+a3*cos(theta231)));
        angle112=atan2(a3*sin(theta232),(a2+a3*cos(theta232)));%op
        theta221=angle12-angle111; %%big
        theta222=angle12-angle112; %%small

            theta2s=theta222;
            theta2sp=theta222*180/pi;
            theta3s=theta232;
            theta3sp=theta232*180/pi
        end 




%% inverse 
%theta1
theta1f=0;
theta1fp=theta1f*180/pi;
Xc1=XX2;
Yc1=YY2;
Zc1=ZZ2;
%theta3（rad)
R1=((Xc1)^2+(Yc1)^2)^0.5;
S1=Zc1-d1;
D1=((Xc1)^2+(Yc1)^2+S1^2-a2^2-a3^2)/(2*a2*a3);
    
    if D1>=0.9999&&D1<=1.0001
        theta3f=0;
        theta3fp=0;
        theta2f=atan2(S1,R1);
        theta2fp=theta22*180/pi;
    else
        theta231=atan2(-(1-D1^2)^0.5,D1);
        theta232=atan2((1-D1^2)^0.5,D1);%op
        angle12=atan2(S1,R1);
        
        angle111=atan2(a3*sin(theta231),(a2+a3*cos(theta231)));
        angle112=atan2(a3*sin(theta232),(a2+a3*cos(theta232)));%op
        theta221=angle12-angle111; %%big
        theta222=angle12-angle112; %%small

            theta2f=theta222;
            theta2fp=theta222*180/pi;
            theta3f=theta232;
            theta3fp=theta232*180/pi
        end 
%DH modeling modified 
a0=0;
alpha0=0;
d1=150;

a1=0;
alpha1=pi/2;
d2=0;

a2=150;
alpha2=0;
d3=0;

a3=150;
alpha3=0;
d4=0;

a4=0;
alpha4=0;
d5=0;
theta5=0;


L(1)=Link('d',d1,'a',a0,'alpha',alpha0,'qlim',[-pi,pi],'modified');
L(2)=Link('d',d2,'a',a1,'alpha',alpha1,'qlim',[-pi/4,pi/2],'modified');
L(3)=Link('d',d3,'a',a2,'alpha',alpha2,'qlim',[-pi/2,pi/2],'modified');
L(4)=Link('d',d4,'a',a3,'alpha',alpha3,'qlim',[-pi/2,pi/2],'modified');
%L(5)=Link('theta',theta5,'a',0,'alpha',-pi/2,'qlim',[3,5],'modified');

robot1=SerialLink(L,'name','huixing');


%%求多项式的矩阵
T=[1 0 0 0 0 0 0 0;
    1 t t^2 t^3 0 0 0 0;
    0 0 0 0 1 0 0 0;
    0 0 0 0 1 t t^2 t^3;
    0 1 0 0 0 0 0 0;
    0 0 0 0 0 1 2*t 3*(t^2);
    0 1 2*t 3*(t)^2 0 -1 0 0;
    0 0 2 6*t 0 0 -2 0]

TMI=inv(T)


%%矩阵右边（初始角度，中间角度，中间角度，末端角度，初始角度速度，末端角度速度，0 0）

thetaM1=[theta1sp;theta1xp;theta1xp;theta1fp;0;0;0;0];
thetaM2=[theta2sp;theta2xp;theta2xp;theta2fp;0;0;0;0];
thetaM3=[theta3sp;theta3xp;theta3xp;theta3fp;0;0;0;0];
%thetaM4=[theta4p;theta4x;theta4x;theta24p;0;0;0;0];

%%A1 为关节1曲线系数  以此类推
A1=(TMI*thetaM1)';
A2=(TMI*thetaM2)';
A3=(TMI*thetaM3)';
%A4=(TMI*thetaM4)';
%%提取系数
a10=A1(1);
a11=A1(2);
a12=A1(3);
a13=A1(4);
a14=A1(5);
a15=A1(6);
a16=A1(7);
a17=A1(8);

a20=A2(1);
a21=A2(2);
a22=A2(3);
a23=A2(4);
a24=A2(5);
a25=A2(6);
a26=A2(7);
a27=A2(8);


a30=A3(1);
a31=A3(2);
a32=A3(3);
a33=A3(4);
a34=A3(5);
a35=A3(6);
a36=A3(7);
a37=A3(8);
%a40=A4(1);
%a41=A4(2);
%a42=A4(3);
%a43=A4(4);

%%然后切割成一小段
t1=0:0.5:tt;
thetaA11=a10+a11.*t1+a12*(t1.*t1)+a13*(t1.*(t1.*t1));
thetaA21=a20+a21.*t1+a22*(t1.*t1)+a23*(t1.*(t1.*t1));
thetaA31=a30+a31.*t1+a32*(t1.*t1)+a33*(t1.*(t1.*t1));
%thetaA4=a40+a41.*t1+a42*(t1.*t1)+a43*(t1.*(t1.*t1));
t2=0:0.5:tt
thetaA12=a14+a15.*t1+a16*(t2.*t2)+a17*(t2.*(t2.*t2));
thetaA22=a24+a25.*t1+a26*(t2.*t2)+a27*(t2.*(t2.*t2));
thetaA32=a34+a35.*t1+a36*(t2.*t2)+a37*(t2.*(t2.*t2));

thetaA1=[thetaA11 thetaA12];
thetaA2=[thetaA21 thetaA22];
thetaA3=[thetaA31 thetaA32];

qt=[thetaA1;thetaA2;thetaA3];

%{
%%求瞬间速度
wa1(1)=A1(4);
wa1(2)=A1(3);
wa1(3)=A1(2);
wa1(4)=A1(1);
waa1=polyder(wa1);
thetaAW1=polyval(waa1,t1);


wa2(1)=A2(4);
wa2(2)=A2(3);
wa2(3)=A2(2);
wa2(4)=A2(1);
waa2=polyder(wa2);
thetaAW2=polyval(waa2,t1);

wa3(1)=A3(4);
wa3(2)=A3(3);
wa3(3)=A3(2);
wa3(4)=A3(1);
waa3=polyder(wa3);
thetaAW3=polyval(waa3,t1);
%}

f=length(t1)+length(t2);
for i=1:1:f
    c1=cos(thetaA1(i)*pi/180);
    c2=cos(thetaA2(i)*pi/180);
    c3=cos(thetaA3(i)*pi/180);
    c4=1;
    s1=sin(thetaA1(i)*pi/180);
    s2=sin(thetaA2(i)*pi/180);
    s3=sin(thetaA3(i)*pi/180);
    s4=0;

    T01=[c1 -s1 0 a0;
        s1 c1 0 0;
        0 0 1 d1;
        0 0 0 1]
    T12=[c2 -s2 0 a1;
        0 0 -1 0;
        s2 c2 0 0;
        0 0 0 1]
    T23=[c3 -s3 0 a2;
        s3 c3 0 0;
        0 0 1 0;
        0 0 0 1]
    T34=[c4 -s4 0 a3;
        s4 c4 0 0;
        0 0 1 0;
        0 0 0 1]

    T=T01*T12*T23*T34;
    T(1,4);
    XX(i)=T(1,4);
    YY(i)=T(2,4);
    ZZ(i)=T(3,4);

end


%%%%%%%%%%开始画图


plot3(XX,YY,ZZ,'LineWidth',2);
hold on;
scatter3(Xs,Ys,Zs,'LineWidth',2);
xlim([-500 500]);
ylim([-500 500]);
zlim([-500 500]);
f=length(t1)+length(t2);

for i=1:1:f
    robot1.plot([0 qt(2,i)*pi/180 qt(3,i)*pi/180 0]);
end 
