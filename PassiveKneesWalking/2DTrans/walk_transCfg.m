% Walkin Simulation Example - Parameter initialization
%     for Matlab 5.2 and up
%
%
% This file sets the parameters that are used during a simulation
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology
clear all
global  parworld
global  parleg1
global 	parleg2
global  mode
global  footholds
global 	current
global 	SOUT
global gamma
global l1
global l2
global r1
global r2
global c1
global c2
global w1
global w2

global m1
global I1
global m2
global I2

global GRAVITY
global K D
global B C R TA1 TA2 H HO 
global SINPUT SOUT
global INI_CON
global RATIO
global TIME_SPAN

GRAVITY=9.81




% world parameters
g     = 9.81;  % gravity
%gamma = 0.01; % slope angle
gamma =0.05;
% leg 1 parameters
l1    = 0.4;       % leg 1: length
r1    = 0.1;       % leg 1: foot radius
c1    = 0.1;       % leg 1: vertical distance hip-CoM
w1    = 0;         % leg 1: horizontal distance hip-CoM
m1    = 1.0;         % leg 1: mass
I1    = 0.01;      % leg 1: moment of inertia

% leg 2 parameters
l2    = l1;    % leg 2: length
r2    = r1;    % leg 2: foot radius
c2    = c1;    % leg 2: vertical distance hip-CoM
w2    = w1;    % leg 2: horizontal distance hip-CoM
m2    = m1;    % leg 2: mass
I2    = I1;    % leg 2: moment of inertia

%parsim = [dt, pert, totallength];
parworld = [g, gamma];
parleg1 = [l1 r1 c1 w1 m1 I1];
parleg2 = [l2 r2 c2 w2 m2 I2];


mode = 'stance phase leg 1';

% independent initial conditions
%{
phi1  = 0.2;  % counter-clockwise rotation of leg 1 
phi1d =-1.4; % velocity of counter-clockwise rotation of leg 1 
phi2d =-0.8 % velocity of counter-clockwise rotation of leg 2

phi2  =-phi1;    % counter-clockwise rotation of leg 2
%}

%phi1  =  0.2015;  % counter-clockwise rotation of leg 1 
phi1  = 0.2015;
phi1d =-1.4052; % velocity of counter-clockwise rotation of leg 1 
phi2d =-1.1205; % velocity of counter-clockwise rotation of leg 2

phi2  =-phi1;    % counter-clockwise rotation of leg 2



% dependent initial conditions (the correct values 
xh    = 0;       % x-coordinate of hip joint
yh    = 0;       % y-coordinate of hip joint
xhd   = 0;      % velocity of x-coordinate of hip joint
yhd   = 0;      % velocity of y-coordinate of hip joint

xf1   = 0;      % location of foothold of leg 1 (equals x-coordinate of contact point if phi1=0)
xf2   = 0;      % location of foothold of leg 2 (equals x-coordinate of contact point if phi2=0)

q  = [xh,  yh,  phi1,  phi2];
qd = [xhd, yhd, phi1d, phi2d];
q
qd
current=1;
footholds = [xf1, xf2];
[q,qd]=wse_dep(q,qd); % adjust initial conditions to meet boundary conditions
q
qd
%INI_CON=[q qd 0.1,0.0,0.1,0.0]
INI_CON=[q qd ]


%{
K=2
D=0.1

B=2.0
R=2.0
C=1.0
TA1=0.08
TA2=0.16
H=1.0
%HO=0.0
HO=0.3
RATIO=10
%}

TIME_SPAN=[0,10]

