animationfig = figure;
scale = 1;
leg1color = [1 0 0];
leg2color = [0 0 1];
torsocolor= [0 0 0];
%   'Position',[0 0.0273438 1 0.935547],...

set(animationfig,...
   'Name', 'Animation',...
   'Units','normalized',...
   'RendererMode','auto',...
   'Renderer','OpenGl',...
   'Color',[1 1 1],...
   'Visible','on');
AxesHandle=axes; 
set(AxesHandle,...
   'Parent',animationfig,...
   'Position',[0 0 1 1],...
   'Ylim',scale*[-0.4 2],...
   'Xlim',scale*[-0.44 maxLeng]);

axis equal
FloorHandle=line;
set(FloorHandle,...
   'Parent',AxesHandle,...
   'Color',[0 0 0],...
   'LineWidth',2,...
   'EraseMode','xor')
Leg1SHandle=line;
set(Leg1SHandle,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')
Leg1THandle=line;
set(Leg1THandle,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')
Leg2SHandle=line;
   set(Leg2SHandle,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')
Leg2THandle=line;
   set(Leg2THandle,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')
torsoHandle=line;
set(torsoHandle,...
   'Parent',AxesHandle,...
   'Color',torsocolor,...
   'LineWidth',2,...
   'EraseMode','xor')

LarmHandle=line;
set(LarmHandle,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')

RarmHandle=line;
set(RarmHandle,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')



global mh;
global mt;
global ms;
global a1;
global b1;
global a2;
global b2;
global ls;
global lt;
global l;
global g;
global gamma

Rgamma = [cos(gamma), -sin(gamma);
          sin(gamma),  cos(gamma)];


% floor
hx=0:0.01:maxLeng;
floorxy = [hx;TerrainSlope(hx)];
set(FloorHandle,'Xdata',floorxy(1,:),'Ydata',floorxy(2,:));


Tt=tout(1):0.01:tout(length(tout));
Yy=interp1(tout,qout,Tt);


pause

for i=1:size(Yy,1)
qt=Yy(i,:);

phi1=qt(1);
phi2=qt(2);
theta1=qt(3);
theta2=qt(4);

armDiff=(theta1-phi1)*0.8;


pHip=qt(5:6);
pHip=pHip(:);
qtorso=0.5*(phi1+theta1)*0.3;

qlarm=+0.5*armDiff+qtorso;
qrarm=-0.5*armDiff+qtorso;


Rphi1 = [cos(phi1), -sin(phi1);
               sin(phi1),  cos(phi1)];
      
Rphi2 = [cos(phi2), -sin(phi2);
               sin(phi2),  cos(phi2)];

Rtorso=[cos(qtorso),-sin(qtorso);
	sin(qtorso),cos(qtorso)];
Rlarm=[cos(qlarm),-sin(qlarm);
	sin(qlarm),cos(qlarm);];
Rrarm=[cos(qrarm),-sin(qrarm);
	sin(qrarm),cos(qrarm);];
	
top=Rtorso*[0,0.7]'+pHip;
throat=Rtorso*[0,0.5]'+pHip;
lHand=Rlarm*[0,-0.6]'+throat;
rHand=Rrarm*[0,-0.6]'+throat;
Larm=[throat,lHand];
Rarm=[throat,rHand];


torso=[pHip,top];



p1Knee=Rphi1*[0;-lt]+pHip;
p1Toe=Rphi2*[0;-ls]+p1Knee;

leg1s=[p1Toe,p1Knee];
leg1t=[p1Knee,pHip];


Rtheta1=[cos(theta1) -sin(theta1);sin(theta1) cos(theta1)];
Rtheta2=[cos(theta2) -sin(theta2);sin(theta2) cos(theta2)];

p2Knee=Rtheta1*[0;-lt]+pHip;
p2toe=Rtheta2*[0;-ls]+p2Knee;
leg2t=[pHip,p2Knee];
leg2s=[p2Knee,p2toe];




set(Leg1SHandle,'Xdata',leg1s(1,[1:2]),'Ydata',leg1s(2,[1:2]));
set(Leg1THandle,'Xdata',leg1t(1,[1:2]),'Ydata',leg1t(2,[1:2]));

set(Leg2SHandle,'Xdata',leg2s(1,[1:2]),'Ydata',leg2s(2,[1:2]));
set(Leg2THandle,'Xdata',leg2t(1,[1:2]),'Ydata',leg2t(2,[1:2]));

set(torsoHandle,'Xdata',torso(1,[1:2]),'Ydata',torso(2,[1:2]));

set(LarmHandle,'Xdata',Larm(1,[1:2]),'Ydata',Larm(2,[1:2]));
set(RarmHandle,'Xdata',Rarm(1,[1:2]),'Ydata',Rarm(2,[1:2]));
  
drawnow
pause(0.01)
end
pause
close (animationfig)

       
