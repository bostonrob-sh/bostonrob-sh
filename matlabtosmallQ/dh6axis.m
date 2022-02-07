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

%        theta    d           a        alpha     offset
L2(1)=Link([0 d1 a0 alpha0],'modified');
L2(2)=Link([0 d2 a1 alpha1],'modified');
L2(3)=Link([0  d3 a2 alpha2],'modified');
L2(4)=Link([0 d4 a3 alpha3 ],'modified');
L2(5)=Link([0 d5 a4 alpha4],'modified');
L2(6)=Link([0 d6 a5 alpha5],'modified');
L2(7)=Link([0 d7 a6 alpha6],'modified');

robot2=SerialLink(L2,'name','xxx');
robot2.teach;


