syms c1 s1 c2 s2 c3 s3 c4 s4 c5 s5 c6 s6 

clear;
q0=[45  -45  100  10 90 0 0];
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



c1=cos(q0(1)*pi/180);
s1=sin(q0(1)*pi/180);
c2=cos(q0(2)*pi/180);
s2=sin(q0(2)*pi/180);
c3=cos(q0(3)*pi/180);
s3=sin(q0(3)*pi/180);
c4=cos(q0(4)*pi/180);
s4=sin(q0(4)*pi/180);
c5=cos(q0(5)*pi/180);
s5=sin(q0(5)*pi/180);
c6=cos(q0(6)*pi/180);
s6=sin(q0(6)*pi/180);

  T01=[c1 -s1 0 0;
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
    
    T34=[c4 -s4 0 0;
        0 0 -1 -d4;
        s4 c4 0 0;
        0 0 0 1];
    
     T45=[c5 -s5 0 0;
        0 0 1 0;
        -s5 -c5 0 0;
        0 0 0 1];

     T56=[c6 -s6 0 0;
           0 0 -1 0;
           s6 c6 0 0;
           0 0 0 1];
       
       T67=[1 0 0 0;
           0 1 0 0;
           0 0 1 250;
           0 0 0 1];
       
 T=T01*T12*T23*T34*T45*T56*T67

% [ ca*cb*cr - sa*sr, - cr*sa - ca*cb*sr, ca*sb]
% [ ca*sr + cb*cr*sa,   ca*cr - cb*sa*sr, sa*sb]
% [           -cr*sb,              sb*sr,    cb]

if (T(3,3))==1  %%b=0度，a r自由决定
    b=0;
    a=0;
    r=atan2(T(2,1),T(1,1));
else   %%b!=0度
    b=atan2((1-(T(3,3))^2)^(0.5),T(3,3));
    a=atan2(T(2,3),T(1,3));
    r=atan2(T(3,2),-T(3,1));
end
ca=cos(a);
sa=sin(a);
sb=sin(b);
cb=cos(b);
sr=sin(r);
cr=cos(r);

    

 
 eul=[a*180/pi b*180/pi r*180/pi]
 
 er=eulerangle(a*180/pi, b*180/pi, r*180/pi)