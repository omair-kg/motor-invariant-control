clear all

global ITables;

STables=[
	-0.015;
	-0.01;
	-0.005;
	0;
	0.01;
	0.02;
	0.025;
	]
SlopesTable=STables-0.0553
	%[
	%-0.0703
   	%-0.0653
   	%-0.0603
   	%-0.0553
   	%-0.0453
   	%-0.0353
   	%-0.0303
	%]

ITables=[
	0.1853   -0.3160   -0.3160   -1.0804    0.3004    0.3004;
	0.1850   -0.3057   -0.3057   -1.0763    0.2147    0.2147;
	0.1843   -0.2950   -0.2950   -1.0705    0.1271    0.1271;
	0.1828	 -0.2835   -0.2835   -1.0624   -0.0367   -0.0367;
	0.1785   -0.2592   -0.2592   -1.0388   -0.1464   -0.1464;
	0.1700   -0.2307   -0.2307   -1.0000   -0.3442   -0.3442;
	0.1630   -0.2137   -0.2137   -0.9719   -0.4591   -0.4591;
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


global SpeedAction
global SlopeAction
global SslopeAction;
global SspeedAction;


%{
qref=ITables(4,:);
SpeedAction=0.8;
SlopeAction=0.0;
SslopeAction=[1 1 0]'
SspeedAction=[1 1 0]'
%}

qref=ITables(4,:);
SpeedAction=1.0;
SlopeAction=0.1;
SslopeAction=[1 1 1]'
SspeedAction=[1 1 1]'

%{
qref=ITables(4,:);
SpeedAction=1.5;
SlopeAction=0.0;
SslopeAction=[1 1 1]'
SspeedAction=[1 1 1]'
%}
%{
qref=ITables(4,:);
SpeedAction=1.0;
SlopeAction=0.05;
SslopeAction=[1 1 1]'
SspeedAction=[1 1 1]'
%}
%{
qref=ITables(1,:);
SpeedAction=1.0;
SlopeAction=0.065;
SslopeAction=[1 1 1]'
SspeedAction=[1 1 1]'
%}



global q1;%stance leg angle;
global q2;%swing leg angle;
global q3;%swing theft angle;


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

GRAVITY=9.81;
g=GRAVITY;
TIME_SPAN=[0,2]




INI_CON=[q1,q2,q3,dq1,dq2,dq3]
TIME_SPAN=[0,10]
