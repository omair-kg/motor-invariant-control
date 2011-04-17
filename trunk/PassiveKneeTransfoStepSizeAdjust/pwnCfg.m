clear all
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
global StepSizeAction

STables=[
	-0.015;
	-0.01;
	-0.005;
	0;
	0.01;
	0.02;
	0.025;
	]
SlopesTable=[
	-0.0703
   	-0.0653
   	-0.0603
   	-0.0553
   	-0.0453
   	-0.0353
   	-0.0303
	]
ITables=[
	0.1853   -0.3160   -0.3160   -1.0804    0.3004    0.3004;
	0.1850   -0.3057   -0.3057   -1.0763    0.2147    0.2147;
	0.1843   -0.2950   -0.2950   -1.0705    0.1271    0.1271;
	0.1828	 -0.2835   -0.2835   -1.0624   -0.0367   -0.0367;
	0.1785   -0.2592   -0.2592   -1.0388   -0.1464   -0.1464;
	0.1700   -0.2307   -0.2307   -1.0000   -0.3442   -0.3442;
	0.1630   -0.2137   -0.2137   -0.9719   -0.4591   -0.4591;
	]

IPos	= [0.5013,	0.4907,	0.4793,	0.4663,	0.4377,0.4007,	0.3767]'
ISpeed	= [-0.2780 	-0.1995 -0.1187 0.0345 0.1409 0.3442 0.4724]'


global q1;%stance leg angle;
global q2;%swing leg angle;
global q3;%swing theft angle;
SpeedAction=1;
SlopeAction=-0.005;

%slope+0.015
%qref=[0.1853   -0.3160   -0.3160   -1.0804    0.3004    0.3004   -0.0654]
%slope+0.01
%qref=[0.1850   -0.3057   -0.3057   -1.0763    0.2147    0.2147]
%slop +0.005
%qref=[0.1843   -0.2950   -0.2950   -1.0705    0.1271    0.1271]
%slop 0 step 
qref=[0.1828,-0.2835,-0.2835,-1.0624,-0.0367,-0.0367]
%slope -0.01 
%qref=[0.1785   -0.2592   -0.2592   -1.0388   -0.1464   -0.1464]
%slope -0.02 
%qref=[0.1700   -0.2307   -0.2307   -1.0000   -0.3442   -0.3442]
%splop -0.025 
%qref=[0.1630   -0.2137   -0.2137   -0.9719   -0.4591   -0.4591   -0.0253]
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
TIME_SPAN=[0,20]
INI_CON=[q1,q2,q3,dq1,dq2,dq3]

