% Walking Simulation Example - Equations Of Motion
%     for Matlab 5.2 and up
%
%
% This file calculates the accelerations and contact forces of the
% simplest passive dynamic walker with upper body. This file is called
% by the numerical integration file wse_rk4.m. This file uses wse_mat.m
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology


function [qdd, fc] = ub_eom(q, qd, mode)
global parworld parhip parleg1 parleg2 footholds
% world parameters
g     = parworld(1);  % gravity
gamma = parworld(2);  % slope angle

% leg parameters
m1    = parleg1(5);   % leg 1: mass
I1    = parleg1(6);   % leg 1: moment of inertia
m2    = parleg2(5);   % leg 2: mass
I2    = parleg2(6);   % leg 2: moment of inertia

% states
phi1   = q(3);
phi2   = q(4);
phi1d  = qd(3);
phi2d  = qd(4);

% calculation of required matrices
T = wse_mat('T',q,qd);
TT = wse_mat('TT',q,qd);

% mass matrix 
M = diag([m1, m1, I1, m2, m2, I2]);

% construction of reduced mass matrix  
A = T.'*M;  % A is a temporary matrix, employed for calculation speed
Mr = A*T;

%gravity forces
fg = M * [ g*sin(gamma);
          -g*cos(gamma);
           0;
           g*sin(gamma);
          -g*cos(gamma);
           0];

% reduced force vector
fr = T.'*fg  - A*TT;


switch mode
case 'stance phase leg 1'
   
   % complete mass matrix including constraint equations
   D1 = wse_mat('D1',q,qd);
   S = [Mr   D1.'						
   	  D1 zeros(size(D1,1))];
   % complete right hand side of equations of motion, including corriolis terms     
   DD1 = wse_mat('DD1',q,qd);
   rhs = [fr; 
          -DD1];

   % solve equations of motion
   solution = S\rhs;
   
   % sort: solution contains both contact forces and leg accelerations
   qdd = solution(1:4).';
   fc  = [solution(5:6); 0; 0].';

case 'stance phase leg 2'
   
   % complete mass matrix including constraint equations
   D2 = wse_mat('D2',q,qd);
   S = [Mr   D2.'						
   	  D2 zeros(size(D2,1))];
   % complete right hand side of equations of motion, including corriolis terms     
   DD2 = wse_mat('DD2',q,qd);
   rhs = [fr; 
          -DD2];

   % solve equations of motion
   solution = S\rhs;
   
   % sort: solution contains both contact forces and leg accelerations
   qdd = solution(1:4).';
   fc  = [0; 0; solution(5:6)].';

case 'heel strike leg 1'
   % this part calculates a collision between the floor and leg 1 which is about 
   % to become the new stance leg
   
   % complete mass matrix including constraint equations
   D1 = wse_mat('D1',q,qd);
   S = [Mr   D1.'						
   	  D1 zeros(size(D1,1))];
        
   % complete right hand side of impact equations     
   e = 0;
   rhs =  [Mr; -e*D1]*qd.';

   % solve equations of motion
   solution = S\rhs;
   
   % sort: solution contains both contact impulses and leg velocities
   qdd = solution(1:4).';  %note that qdd is not a correct name now; it contains velocities
   fc  = [solution(5:6); 0; 0].';  % idem; fc contains impulses, not forces
   
case 'heel strike leg 2'
   % this part calculates a collision between the floor and leg 2 which is about 
   % to become the new stance leg
   
   % complete mass matrix including constraint equations
   D2 = wse_mat('D2',q,qd);
   S = [Mr   D2.'						
   	  D2 zeros(size(D2,1))];
        
   % complete right hand side of impact equations     
   e = 0;
   rhs =  [Mr; -e*D2]*qd.';

   % solve equations of motion
   solution = S\rhs;
   
   % sort: solution contains both contact impulses and leg velocities
   qdd = solution(1:4).';  %note that qdd is not a correct name now; it contains velocities
   fc  = [0; 0; solution(5:6)].';  % idem; fc contains impulses, not forces
   
end