% Walkin Simulation Example - Parameter initialization
%     for Matlab 5.2 and up
%
%
% This file sets the parameters that are used during a simulation
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

% simulation parameters
dt    = 0.01;  % simulation step size
pert  = 1e-5;  % perturbation size for limit cycle analysis
totallength =  188; % total amount of sample points that are simulated (recycled during limit cycle analysis)

% world parameters
g     = 9.81;  % gravity
gamma = 0.01; % slope angle

% leg 1 parameters
l1    = 0.4;       % leg 1: length
r1    = 0.1;       % leg 1: foot radius
c1    = 0.1;       % leg 1: vertical distance hip-CoM
w1    = 0;         % leg 1: horizontal distance hip-CoM
m1    = 1;         % leg 1: mass
I1    = 0.01;      % leg 1: moment of inertia

% leg 2 parameters
l2    = l1;    % leg 2: length
r2    = r1;    % leg 2: foot radius
c2    = c1;    % leg 2: vertical distance hip-CoM
w2    = w1;    % leg 2: horizontal distance hip-CoM
m2    = m1;    % leg 2: mass
I2    = I1;    % leg 2: moment of inertia

parsim = [dt, pert, totallength];
parworld = [g, gamma];
parleg1 = [l1 r1 c1 w1 m1 I1];
parleg2 = [l2 r2 c2 w2 m2 I2];

