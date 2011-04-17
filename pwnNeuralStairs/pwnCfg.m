clear all

global maxLeng
maxLeng=20;

global ITables;
global STables;
global IPos;
global ISpeed;

STables=[
	-0.0503;
	-0.0403;
	-0.0304;
	-0.0204;
	-0.0103;
	-3.5000e-04;
	-0.0603;
	-0.0703;
	-0.0803;
	-0.0903;
	-0.1003;
	-0.1103;
	-0.1203;
	-0.1303;
	]


ITables=[ 
	%
	0.1655   -0.2662   -0.2662   -0.9307    0.3487    0.3487   -0.6783    0.5083    0.1337    0.2957;
	%
	0.1629   -0.2436   -0.2436   -0.9028    0.2244    0.2244   -0.6436    0.5136    0.1387    0.2886;
	0.1575   -0.2182   -0.2182   -0.8613    0.1048    0.1048   -0.6043    0.5181    0.1438    0.2814;
	0.1484   -0.1891   -0.1891   -0.7995   -0.0038   -0.0038   -0.5586    0.5216    0.1492    0.2737;
	0.1324   -0.1531   -0.1531   -0.7005   -0.0864   -0.0864   -0.5020    0.5238    0.1551    0.2657;
	0.0978   -0.0985   -0.0985   -0.4978   -0.0851   -0.0851   -0.4181    0.5229    0.1614    0.2583;
	0.1671   -0.2878   -0.2878   -0.9505    0.4765    0.4765   -0.7096    0.5026    0.1292    0.3021;
	0.1669   -0.3076   -0.3076   -0.9631    0.6024    0.6024   -0.7378    0.4961    0.1248    0.3083;
	0.1660   -0.3267   -0.3267   -0.9711    0.7267    0.7267   -0.7633    0.4893    0.1205    0.3142;
	0.1647   -0.3454   -0.3454   -0.9754    0.8510    0.8510   -0.7870    0.4821    0.1164    0.3196;
	0.1629   -0.3636   -0.3636   -0.9755    0.9763    0.9763   -0.8094    0.4735    0.1119    0.3253;
	0.1600   -0.3807   -0.3807   -0.9734    1.0918    1.0918   -0.8289    0.4636    0.1071    0.3312;
	0.1582   -0.3989   -0.3989   -0.9738    1.1998    1.1998   -0.8462    0.4537    0.1026    0.3365;
	0.1585   -0.4192   -0.4192   -0.9841    1.2787    1.2787   -0.8621    0.4380    0.0960    0.3433;
	]

%IPos	= [0.5013,	0.4907,	0.4793,	0.4663,	0.4377,0.4007,	0.3767]'
IPos=ITables(:,1)-ITables(:,2);
%ISpeed	= [-0.2780 	-0.1995 -0.1187 0.0345 0.1409 0.3442 0.4724]'
ISpeed=ITables(:,5)./ITables(:,4);








global mh;
global mt;
global ms;
global a1;
global b1;
global a2;
global b2;

mh=0.5;
mt=0.5;
ms=0.05;

a1=0.375;
b1=0.125;
a2=0.175;
b2=0.325;

%xinit=[ 0.1655   -0.2662   -0.2662   -0.9307    0.3487    0.3487   -0.6783    0.5083    0.1337    0.2957]
global q1;%stance leg angle;
global q2;%swing leg angle;
global q3;%swing theft angle;

global WALKING_INDEX;
global SpeedAction
global SlopeAction
global SslopeAction;
global SspeedAction;

WALKING_INDEX=9;
SpeedAction=1.0;
SlopeAction=0-STables(WALKING_INDEX);
SslopeAction=[1 1 1]'
SspeedAction=[1 1 1]'

qref=ITables(WALKING_INDEX,:);

q1=qref(1)+SlopeAction;
q2=qref(2)+SlopeAction;
q3=qref(3)+SlopeAction;

global dq1;
global dq2;
global dq3;

dq1=qref(4)*SpeedAction;
dq2=qref(5)*SpeedAction;
dq3=qref(6)*SpeedAction;


global gamma2;
global gamma;
gamma2=q1+q2;
gamma=0.5*gamma2;






global ls;
global lt;
global l;
ls=a1+b1;
lt=a2+b2;
l=ls+lt;
global INI_CON
global TIME_SPAN
global g;

GRAVITY=9.81
g=GRAVITY;





INI_CON=[q1,q2,q3,dq1,dq2,dq3]
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
HO=0.0
RATIO=10
OS_INI_CON=qref([7:10])


