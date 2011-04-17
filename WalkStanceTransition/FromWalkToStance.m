clear all
global mh;
global mt;
global ms;
global a1;
global b1;
global a2;
global b2;

global MHStance
global MTStance
global MSStance

indx=1;
a=1
r=1
b=1

STables=[
	-0.0604;
	]
ITables=[ 
	0.1630   -0.2837   -0.2837   -0.9717    0.4048    0.4048   -0.7138    0.4977    0.1263    0.3066	
	]

global q1;%stance leg angle;
global q2;%swing leg angle;
global q3;%swing theft angle;

SlopeChange=0.00;
SlopeOffset=0.00;
%SlopeOffset=0.0;
poschange=0.0;
qref=ITables(indx,:);
q1=qref(1)+SlopeChange+SlopeOffset+poschange;
q2=qref(2)+SlopeChange+SlopeOffset-poschange;
q3=qref(3)+SlopeChange+SlopeOffset-poschange;

global dq1;
global dq2;
global dq3;

speedScale=1;


global gamma2;
global gamma;






global ls;
global lt;
global l;

global INI_CON
global TIME_SPAN
global g;

GRAVITY=9.81
g=GRAVITY;






TIME_SPAN=[0,30]


global B C R TA1 TA2 H HO 
global SINPUT SOUT
global OS_INI_CON
global RATIO
global mode




B=2.0
R=2.0
C=1.0
TA1=0.08
TA2=0.16
H=1.0
%HO=0.0
HO=0.3
RATIO=10

global stepcount;

stepcount=3
generateWalkData



Sq=yTrans(1);
Sdq=yTrans(4);

plot(qout(:,1),qout(:,7))
hold on
plot(qout(1,1),qout(1,7),'rx')
plot(Sq,Sdq,'gx')
hold off

saveas(gca,'walkstace.eps','psc2');


Sq=Sq-sum(yTrans(1:2))/2;
S=w2sTransform(l,Sq,Sdq);
halfStepSize=l*sin(abs(Sq));


global L;
% m |mass
global m;
% gamma is called double support ratio, 
global gamma;
% K defines the convergence rate to the desired energy
global g;

% W is half the stance width
global W;
global alpha;
global yL;
global yR;
global leg;
global d;



leg=l;
W=2*halfStepSize;
yL=-0.5*W;
yR=0.5*W;





% m |mass
m=0.5;
g=9.8;

%neural oscillator configuration
global B C R TA1 TA2 H HO 
global SINPUT SOUT
global OS_INI_CON
global RATIO
global mode
global SpeedAction
	
SpeedAction=1
mode=1


B=2.0
R=2.0
C=1
TA1=0.08
TA2=0.16

H=1.0
HO=0.3


%H=0.0
%HO=0.0

RATIO=10


%initial condition
global INIT_CON
global TIME_SPAN

%INI_CON=[0,0.5,0.0623   -0.0816    0.0684    0.0060]





INI_CON=[0,S(2),0.0   -0.0    0.0    0.000]
SpeedAction=S(2)/0.5;
TIME_SPAN=[0,1]
dataGenerate
plot(Y(:,1),Y(:,2),'r');
hold on
plot(Y(1,1),Y(1,2),'X');
hold off
saveas(gca,'stanceState.eps','psc2');














