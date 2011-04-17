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

indx=4;
a=1
r=1
b=0.75

mh=0.5*a;
mt=0.5;
ms=0.1*mt;



a1=0.375*2/(1+r);
b1=0.125*2/(1+r);

a2=0.175*2*r/(1+r);
b2=0.325*2*r/(1+r);


MHStance=mh
MTStance=mt*2*b/(1+b)
MSStance=ms*2*b/(1+b)

mt=2*mt/(1+b)
ms=2*ms/(1+b)
%offset 70%-130%
%speed -2.5 2.5%


STables=[
	-0.0503;
	-0.0403;
	-0.0304;
	-0.0604;
	-0.0704;
	-0.0804;
	-0.0903;
	-0.1003;
	-0.1103;
	-0.1203;
	-0.1303;
	-0.1404;
	-0.1504;
	-0.1604;
	]
ITables=[ 
	%
	0.1830   -0.2837   -0.2837   -1.0626    0.0376    0.0376   -0.5594    0.5337    0.1672    0.2396
	%
	0.1785   -0.2592   -0.2592   -1.0389   -0.1468   -0.1468   -0.4790    0.5301    0.1815    0.2158
	0.1700   -0.2307   -0.2307   -1.0000   -0.3443   -0.3443   -0.3596    0.5100    0.2029    0.1812
	0.1630   -0.2837   -0.2837   -0.9717    0.4048    0.4048   -0.7138    0.4977    0.1263    0.3066
%0.1807   -0.3014   -0.3014   -1.0965    0.1481    0.1481   -0.6329    0.5284    0.1521    0.2650
	%0.1809   -0.3016   -0.3016   -1.0980    0.1448    0.1448   -0.6311    0.5287    0.1526    0.2641
	0.1852   -0.3259   -0.3259   -1.0831    0.3839    0.3839   -0.6694    0.5255    0.1475    0.2722
	0.1841   -0.3448   -0.3448   -1.0847    0.5466    0.5466   -0.7102    0.5185    0.1399    0.2843
	0.1819   -0.3626   -0.3626   -1.0822    0.7031    0.7031   -0.7450    0.5106    0.1333    0.2946
	0.1789   -0.3796   -0.3796   -1.0765    0.8537    0.8537   -0.7752    0.5023    0.1273    0.3035
	0.1753   -0.3960   -0.3960   -1.0683    0.9982    0.9982   -0.8017    0.4936    0.1220    0.3113
	0.1713   -0.4120   -0.4120   -1.0581    1.1382    1.1382   -0.8252    0.4848    0.1170    0.3182
	0.1669   -0.4276   -0.4276   -1.0450    1.2762    1.2762   -0.8467    0.4755    0.1121    0.3245
	0.1612   -0.4419   -0.4419   -1.0283    1.4082    1.4082   -0.8660    0.4646    0.1069    0.3309
	0.1533   -0.4540   -0.4540   -1.0093    1.5218    1.5218   -0.8810    0.4515    0.1011    0.3376
	0.1432   -0.4639   -0.4639   -0.9940    1.6027    1.6027   -0.8891    0.4377    0.0954    0.3436	
	]
IPosTable=ITables(:,1)-ITables(:,2)
ISpeedTables=ITables(:,5)./ITables(:,4)

PosOffTables=[6 -0.14,0.05]
	
	


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
HO=0.3
RATIO=10
OS_INI_CON=qref(7:10)

