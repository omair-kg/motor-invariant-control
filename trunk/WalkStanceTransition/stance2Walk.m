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
	%0.1630   -0.2837   -0.2837   -0.9717    0.4048    0.4048   -0.7138    0.4977    0.1263    0.3066
	0.1630   -0.2837   -0.2837   -0.9717    0.9717*0.9    0.971*0.9   -0.7138    0.4977    0.1263    0.3066	
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

stepcount=5
generateWalkData
plot(qout(:,3),qout(:,9))
hold on
plot(qout(1,3),qout(1,9),'rx')
plot(-0.2837,0.4048 ,'kx')
hold off
saveas(gca,'s2walk.eps','psc2');
