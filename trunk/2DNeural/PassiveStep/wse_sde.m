
% Walking Simulation Example - Symbolically derived Differential Equations
%       for Matlab 5.2 and up, needs symbolic toolbox
%
%
% This file derives the differential equations necessary for numerical
% simulation of a simple passive dynamic walker.
%
% This file creates (overwrites) the file 'wse_mat.m' containing the matrices 
% used for the evaluation of the equations of motion in wse_eom.m
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

clear all

% creation of symbolic variables
% world parameters
syms  g      % gravity
syms  gamma  % slope angle

% leg 1 parameters
syms  l1     % leg 1: length
syms  r1     % leg 1: foot radius
syms  c1     % leg 1: vertical distance hip-CoM
syms  w1     % leg 1: horizontal distance hip-CoM
syms  m1     % leg 1: mass
syms  I1     % leg 1: moment of inertia

% leg 2 parameters
syms  l2     % leg 2: length
syms  r2     % leg 2: foot radius
syms  c2     % leg 2: vertical distance hip-CoM
syms  w2     % leg 2: horizontal distance hip-CoM
syms  m2     % leg 2: mass
syms  I2     % leg 2: moment of inertia


% foothold locations (equal to contact location if phi=0)
syms xf1     % x-coordinate of foothold location for leg 1
syms xf2     % x-coordinate of foothold location for leg 2


% generalized coordinates and their derivatives
syms  xh    xhd    % x-coordinate of hip joint
syms  yh    yhd    % y-coordinate of hip joint
syms  phi1  phi1d  % counter-clockwise rotation of leg 1 
syms  phi2  phi2d  % counter-clockwise rotation of leg 2


% creation of vector of generalized coordinates
q  = [xh;  yh;  phi1;  phi2];   % generalized coordinates
qd = [xhd; yhd; phi1d; phi2d];  % velocities of generalized coordinates

% expression of all model coordinates in terms of generalized coordinates
x = [ xh + c1*sin(phi1) + w1*cos(phi1);   % leg 1: x-coordinate of CoM
		yh - c1*cos(phi1) + w1*sin(phi1);   % leg 1: y-coordinate of CoM
		phi1;                               % leg 1: ccw rotation angle
      xh + c2*sin(phi2) + w2*cos(phi2);   % leg 2: x-coordinate of CoM
		yh - c2*cos(phi2) + w2*sin(phi2);   % leg 2: y-coordinate of CoM
		phi2];                              % leg 2: ccw rotation angle
      
   
% expression of ground contact conditions in terms of generalized coordinates
g1 = [xh + (l1-r1)*sin(phi1) + r1*phi1 - xf1;   % leg 1: horizontal constraint
      yh - (l1-r1)*cos(phi1) - r1];             % leg 1: vertical constraint
      
g2 = [xh + (l2-r2)*sin(phi2) + r2*phi2 - xf2;   % leg 2: horizontal constraint
      yh - (l2-r2)*cos(phi2) - r2];             % leg 2: vertical constraint
      
   
% derivation of partial derivatives of x to q      
T = simple(jacobian(x,q));

% derivation of second order derivative of x
TT = simple(jacobian(T*qd,q)*qd);

% derivation of partial derivatives of g1 and g2 to q
D1 = simple(jacobian(g1,q));
D2 = simple(jacobian(g2,q));

% derivation of second order derivatives of g1 and g2
DD1 = simple(jacobian(D1*qd,q)*qd);
DD2 = simple(jacobian(D2*qd,q)*qd);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% creation of the file 'wse_mat.m' (adjust the directory if necessary)
% header
filename = 'g:\onderwijs\Service Robots\walking simulation example\wse_mat.m';
file_id = fopen(filename,'w');
fprintf(file_id,'%% Walking Simulation Example - MATrices for evaluation of eguations of motion\n');
fprintf(file_id,'%%       for Matlab 5.2 and up\n');
fprintf(file_id,'%%\n');
fprintf(file_id,'%% Automatically created by wse_sde.m\n\n');
fprintf(file_id,'function outputmatrix=wse_mat(matrixtype, q, qd);\n');
fprintf(file_id,'global parworld parleg1 parleg2 footholds\n');
fprintf(file_id,'');

% unpacking of parameters
fprintf(file_id,'g     = parworld(1);  %% gravity\n');
fprintf(file_id,'gamma = parworld(2);  %% slope angle\n');
fprintf(file_id,'\n');
fprintf(file_id,'%% leg 1 parameters\n');
fprintf(file_id,'l1    = parleg1(1);   %% leg 1: length\n');
fprintf(file_id,'r1    = parleg1(2);   %% leg 1: foot radius\n');
fprintf(file_id,'c1    = parleg1(3);   %% leg 1: vertical distance hip-CoM\n');
fprintf(file_id,'w1    = parleg1(4);   %% leg 1: horizontal distance hip-CoM\n');
fprintf(file_id,'m1    = parleg1(5);   %% leg 1: mass\n');
fprintf(file_id,'I1    = parleg1(6);   %% leg 1: moment of inertia\n');
fprintf(file_id,'\n');
fprintf(file_id,'%% leg 2 parameters\n');
fprintf(file_id,'l2    = parleg2(1);   %% leg 2: length\n');
fprintf(file_id,'r2    = parleg2(2);   %% leg 2: foot radius\n');
fprintf(file_id,'c2    = parleg2(3);   %% leg 2: vertical distance hip-CoM\n');
fprintf(file_id,'w2    = parleg2(4);   %% leg 2: horizontal distance hip-CoM\n');
fprintf(file_id,'m2    = parleg2(5);   %% leg 2: mass\n');
fprintf(file_id,'I2    = parleg2(6);   %% leg 2: moment of inertia\n');
fprintf(file_id,'\n');
fprintf(file_id,'%% foothold locations (equal to contact location if phi=0)\n');
fprintf(file_id,'xf1   = footholds(1);   %% x-coordinate of foothold location for leg 1\n');
fprintf(file_id,'xf2   = footholds(2);   %% x-coordinate of foothold location for leg 2\n');
fprintf(file_id,'\n');
fprintf(file_id,'%% generalized coordinates and velocities\n');
fprintf(file_id,'xh    = q(1);   %% x-coordinate of hip\n');
fprintf(file_id,'yh    = q(2);   %% y-coordinate of hip\n');
fprintf(file_id,'phi1  = q(3);   %% ccw rotation angle of leg 1\n');
fprintf(file_id,'phi2  = q(4);   %% ccw rotation angle of leg 2\n');
fprintf(file_id,'\n');
fprintf(file_id,'xhd   = qd(1);  %% velocity of x-coordinate of hip\n');
fprintf(file_id,'yhd   = qd(2);  %% velocity of y-coordinate of hip\n');
fprintf(file_id,'phi1d = qd(3);  %% velocity of ccw rotation angle of leg 1\n');
fprintf(file_id,'phi2d = qd(4);  %% velocity of ccw rotation angle of leg 2\n');
fprintf(file_id,'\n');


% matrices
fprintf(file_id,'switch matrixtype\n');
fprintf(file_id,'case ''x''\n');
outputmatrix = x;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'case ''T''\n');
outputmatrix = T;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'case ''TT''\n');
outputmatrix = TT;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'case ''g1''\n');
outputmatrix = g1;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'case ''g2''\n');
outputmatrix = g2;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'case ''D1''\n');
outputmatrix = D1;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'case ''D2''\n');
outputmatrix = D2;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'case ''DD1''\n');
outputmatrix = DD1;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'case ''DD2''\n');
outputmatrix = DD2;
wse_wr(file_id, outputmatrix);

fprintf(file_id,'end\n');
st = fclose(file_id);

if st==0
   disp(strcat('Results written to:',filename))
else
   disp(strcat('Failed writing to:',filename))
end