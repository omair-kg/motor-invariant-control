  % Walking Simulation Example - MATrices for evaluation of eguations of motion
%       for Matlab 5.2 and up
%
% Automatically created by wse_sde.m

function outputmatrix=wse_mat(matrixtype, q, qd);
global parworld parleg1 parleg2 footholds
g     = parworld(1);  % gravity
gamma = parworld(2);  % slope angle

% leg 1 parameters
l1    = parleg1(1);   % leg 1: length
r1    = parleg1(2);   % leg 1: foot radius
c1    = parleg1(3);   % leg 1: vertical distance hip-CoM
w1    = parleg1(4);   % leg 1: horizontal distance hip-CoM
m1    = parleg1(5);   % leg 1: mass
I1    = parleg1(6);   % leg 1: moment of inertia

% leg 2 parameters
l2    = parleg2(1);   % leg 2: length
r2    = parleg2(2);   % leg 2: foot radius
c2    = parleg2(3);   % leg 2: vertical distance hip-CoM
w2    = parleg2(4);   % leg 2: horizontal distance hip-CoM
m2    = parleg2(5);   % leg 2: mass
I2    = parleg2(6);   % leg 2: moment of inertia

% foothold locations (equal to contact location if phi=0)
xf1   = footholds(1);   % x-coordinate of foothold location for leg 1
xf2   = footholds(2);   % x-coordinate of foothold location for leg 2

% generalized coordinates and velocities
xh    = q(1);   % x-coordinate of hip
yh    = q(2);   % y-coordinate of hip
phi1  = q(3);   % ccw rotation angle of leg 1
phi2  = q(4);   % ccw rotation angle of leg 2

xhd   = qd(1);  % velocity of x-coordinate of hip
yhd   = qd(2);  % velocity of y-coordinate of hip
phi1d = qd(3);  % velocity of ccw rotation angle of leg 1
phi2d = qd(4);  % velocity of ccw rotation angle of leg 2

switch matrixtype
case 'x'
outputmatrix = [xh+c1*sin(phi1)+w1*cos(phi1);
     yh-c1*cos(phi1)+w1*sin(phi1);
     phi1; 
     xh+c2*sin(phi2)+w2*cos(phi2);
     yh-c2*cos(phi2)+w2*sin(phi2);
     phi2];
case 'T'
outputmatrix = [1, 0, c1*cos(phi1)-w1*sin(phi1), 0;
     0, 1, c1*sin(phi1)+w1*cos(phi1), 0;
     0, 0, 1, 0;
     1, 0, 0, c2*cos(phi2)-w2*sin(phi2);
     0, 1, 0, c2*sin(phi2)+w2*cos(phi2);
     0, 0, 0, 1];
case 'TT'
outputmatrix = [(-c1*sin(phi1)-w1*cos(phi1))*phi1d^2;
     (c1*cos(phi1)-w1*sin(phi1))*phi1d^2;
     0;
     (-c2*sin(phi2)-w2*cos(phi2))*phi2d^2;
     (c2*cos(phi2)-w2*sin(phi2))*phi2d^2;
     0];
case 'g1'
outputmatrix = [xh+(l1-r1)*sin(phi1)+r1*phi1-xf1;
     yh-(l1-r1)*cos(phi1)-r1];
case 'g2'
outputmatrix = [xh+(l2-r2)*sin(phi2)+r2*phi2-xf2;
     yh-(l2-r2)*cos(phi2)-r2];
case 'D1'
outputmatrix = [1, 0, (l1-r1)*cos(phi1)+r1, 0;
     0, 1, (l1-r1)*sin(phi1), 0];
case 'D2'
outputmatrix = [1, 0, 0, (l2-r2)*cos(phi2)+r2;
     0, 1, 0, (l2-r2)*sin(phi2)];
case 'DD1'
outputmatrix = [-(l1-r1)*sin(phi1)*phi1d^2;
     (l1-r1)*cos(phi1)*phi1d^2];
case 'DD2'
outputmatrix = [-(l2-r2)*sin(phi2)*phi2d^2;
     (l2-r2)*cos(phi2)*phi2d^2];
end
