function rm=eulerangle(roll,pitch,yaw)

%xyz euler 
rpy=[roll pitch yaw];
ca=cos(rpy(1)*pi/180);
sa=sin(rpy(1)*pi/180);
cb=cos(rpy(2)*pi/180);
sb=sin(rpy(2)*pi/180);
cr=cos(rpy(3)*pi/180);
sr=sin(rpy(3)*pi/180);

tz1=[ca -sa 0;
    sa ca 0;
    0 0 1];

ty=[cb 0 sb;
    0 1 0;
    -sb 0 cb];

tz2=[cr -sr 0;
    sr cr 0;
    0 0 1];

rm=tz1*ty*tz2;
end 
