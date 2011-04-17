% Walking Simulation Example - Runge-Kutta 4 routine
%     for Matlab 5.2 and up
%
%
% This file calculates the state of the walker one integration timestep
% in the future from the current state, using wse_eom.m for equations of motion
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology


dt  = parsim(1);
q0  = q_t(current,:);
qd0 = qd_t(current,:);

% Runge-Kutta routine   
qd1 = qd0;
q1  = q0;
[q1, qd1] = wse_dep(q1, qd1);
[k1, fc1] = wse_eom(q1, qd1, mode);
     
qd2 = qd1+(dt/2)*k1;
q2  = q0+(dt/2)*qd1;
[q2, qd2] = wse_dep(q2, qd2);
[k2, fc2] = wse_eom(q2, qd2, mode);   

qd3 = qd1+(dt/2)*k2;
q3  = q0+(dt/2)*qd2;
[q3, qd3] = wse_dep(q3, qd3);
[k3, fc3] = wse_eom(q3, qd3, mode);   
   
qd4 = qd1+dt*k3;
q4  = q0+dt*qd3;
[q4, qd4] = wse_dep(q4, qd4);
[k4, fc4] = wse_eom(q4, qd4, mode);   

q_final  =  q0 + (1/6)*dt*(qd1 + 2*qd2 + 2*qd3 + qd4);
qd_final = qd0 + (1/6)*dt*(k1  + 2*k2  + 2*k3  + k4);

% To prevent numerical errors in the constraint conditions, the values for xh and yh
% and their derivatives are recalculated from phi1 and phi2 and their derivatives
[q_final, qd_final] = wse_dep(q_final, qd_final);


% Storage in state-versus-time matrices
current = current + 1;  % to keep track of where we are in the state-versus-time matrices
q_t(current, :)  = q_final;
qd_t(current, :) = qd_final;
t_t(current) = t_t(current-1) + dt; 
f_t(current-1, :) = fc1;
g_t(current,:) = [wse_mat('g1', q_final, qd_final); wse_mat('g2', q_final, qd_final)].';
xf_t(current, :) = footholds;