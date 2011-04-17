% Walkin Simulation Example - Initial Conditions
%     for Matlab 5.2 and up
%
%
% This file sets the initial conditions for a simulation
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

mode = 'stance phase leg 1';

% independent initial conditions
phi1  = 0.2015;  % counter-clockwise rotation of leg 1 
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
footholds = [xf1, xf2];

