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


global a;
global b;
global Ed;
global K;

global unit;
global v;

unit=0.01;
v=3;


yL=-0.5*W;
yR=0.5*W;


leg=1;
W=0.4;

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
HO=0
%INI_CON=[0,0.5,0.0623   -0.0816    0.0684    0.0060]





INI_CON=[0,0.5,0.0   -0.0    0.0    0.000]
TIME_SPAN=[0,100]
dataGenerate
plot(Y(:,1),Y(:,2),'r');
hold on
plot(Y(1,1),Y(1,2),'X');


INI_CON=[0,0.4,0.0   -0.0    0.0    0.000]
TIME_SPAN=[0,100]
dataGenerate
plot(Y(:,1),Y(:,2),'g');
plot(Y(1,1),Y(1,2),'X');


INI_CON=[0,0.1,0.0   -0.0    0.0    0.000]
TIME_SPAN=[0,100]
dataGenerate
plot(Y(:,1),Y(:,2),'b');
plot(Y(1,1),Y(1,2),'X');



INI_CON=[0,0.8,0.0   -0.0    0.0    0.000]
TIME_SPAN=[0,20]
dataGenerate
plot(Y(:,1),Y(:,2),'k');
plot(Y(1,1),Y(1,2),'X');
hold off

saveas(gca,'uncontrolled.eps','psc2');

