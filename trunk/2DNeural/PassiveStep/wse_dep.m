% Walking Simulation Example - recalculation of DEPendent coordinates
%     for Matlab 5.2 and up
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology


% To prevent numerical errors in the constraint conditions, the values for xh and yh
% and their derivatives are recalculated from phi1 and phi2 and their derivatives

function [q, qd] = wse_dep(q, qd);
global mode current
qd_old = qd;
q_old  = q;


switch mode
case 'stance phase leg 1'
   g_error = wse_mat('g1',q, qd);
   D = wse_mat('D1',q,qd);
case 'stance phase leg 2'
   g_error = wse_mat('g2',q, qd);
   D = wse_mat('D2',q,qd);
end
q(1:2) = q(1:2) - g_error.';
qd(1:2) = -(D(1:2,3:4)*qd(3:4).').';

if (current>1)&((((q-q_old)*(q-q_old).')>0.1)|(((qd-qd_old)*(qd-qd_old).')>0.1))
   warning(strcat('wse_dep.m changed q or qd too much at current=',num2str(current)))
end
