clear;

d1=250;
alpha1=pi/2;
a2=250;
a3=175;
a4=250;




L(1)=Link('d',d1,'a',0,'alpha',0,'qlim',[-pi,pi],'modified');
L(2)=Link('d',0,'a',0,'alpha',alpha1,'qlim',[-pi/2,pi/2],'modified');
L(3)=Link('d',0,'a',a2,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
L(4)=Link('d',0,'a',a3,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
L(5)=Link('d',0,'a',a4,'alpha',0,'qlim',[-pi/2,pi/2],'modified');
%L(6)=Link('d',0,'a',a5,'alpha',0,'qlim',[-pi/2,pi/2],'modified');

robot1=SerialLink(L);
%robot1.tilesize=200;
%W=[-4 +4  -4 +4 -4 +4]
%robot1.plot={'workspace', [-100,-100,100,-100,100]};
%%xlim([-300 300]);
%ylim([-300 300]);
%zlim([-300 300]);
figure(1);
robot1.plot([0 0 0 0 0 ]);
pause(2);
figure(2)
robot1.plot([10 20 0 0 0 ]);

%robot1.teach;



