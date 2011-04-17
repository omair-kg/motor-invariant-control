clear all
global mh;
global mt;
global ms;
global a1;
global b1;
global a2;
global b2;
indx=1
mh=0.5;
mt=0.5;
ms=0.05;

a1=0.375;
b1=0.125;
a2=0.175;
b2=0.325;

%offset 70%-130%
%speed -2.5 2.5%


STables=[
	-0.0503;
	-0.0403;
	-0.0304;
	-0.0204;
	-0.0103;
	-3.5000e-04;
	-0.0603;
	-0.0703;
	
	]
ITables=[ 
	%
	0.1482   -0.2489   -0.2489   -0.8309    0.5173    0.5173   -0.7087    0.4888    0.1213    0.3137;
	%
	0.1444   -0.2251   -0.2251   -0.7964    0.4223    0.4223   -0.6773    0.4949    0.1253    0.3083
	0.1387   -0.1994   -0.1994   -0.7504    0.3323    0.3323   -0.6419    0.5003    0.1294    0.3028
	0.1296   -0.1703   -0.1703   -0.6856    0.2537    0.2537   -0.6004    0.5051    0.1337    0.2970
	0.1143   -0.1350   -0.1350   -0.5855    0.2017    0.2017   -0.5482    0.5091    0.1382    0.2909
	0.0822   -0.0829   -0.0829   -0.3897    0.2337    0.2337   -0.4693    0.5112    0.1430    0.2847
	0.1508   -0.2715   -0.2715   -0.8589    0.6115    0.6115   -0.7371    0.4822    0.1173    0.3189
	0.1533   -0.2940   -0.2940   -0.8849    0.7005    0.7005   -0.7639    0.4747    0.1132    0.3242	
	]
IPosTable=ITables(:,1)-ITables(:,2)
ISpeedTables=ITables(:,5)./ITables(:,4)

PosOffTables=[1 -0.03,0.14;
	6 -0.11 0.05;
	8 0	0]	
	


global q1;%stance leg angle;
global q2;%swing leg angle;
global q3;%swing theft angle;

SlopeChange=-0.0;
SlopeOffset=0.0;
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
is=ISpeedTables(indx)


dq1=qref(4)
dq2=qref(4)*is*speedScale
dq3=qref(4)*is*speedScale


global gamma2;
global gamma;
gamma2=qref(1)+qref(2)+2*SlopeChange;
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
HO=0.6
RATIO=10
OS_INI_CON=qref(7:10)

