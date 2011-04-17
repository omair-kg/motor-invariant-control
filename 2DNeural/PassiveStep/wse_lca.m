% 3D ankle - Limit Cycle Analysis
%     for Matlab 5.2 and up
%
%
% This file tries to find a limit cycle for the simplest 3D walker that steers like a skateboard
% and determines the stability of that limit cycle if it is found
%
%
% Created by Martijn Wisse, Delft Biobot Laboratory, June 2003
% Delft University of Technology

clear all
close all

wse_ini;


startmode = mode;
pert = parsim(2);
accuracy = 1e-10;

% build up a set of initial conditions to perform pertubation simulations
v_begin(1,:) = [q_t(1,3), qd_t(1,3), qd_t(1,4)]; 


epsilon = 1; counter = 0;
while (counter<30)&( epsilon > accuracy)
 counter = counter + 1; disp('.');
 v_begin(2:4,:) = [v_begin(1,:); v_begin(1,:); v_begin(1,:)] + diag([pert,pert,pert]);
 disp(['Iteration cycle ', num2str(counter)]) 
 for i = 1:4  %simulate 4 steps; once without perturbation and once for each of the three perturbed initial conditions

   disp(['  step ', num2str(i)])
   q_t(1,3)  =  v_begin(i,1);
   q_t(1,4)  = -v_begin(i,1);
   qd_t(1,3) =  v_begin(i,2);
   qd_t(1,4) =  v_begin(i,3);
  
   [q_t(1,:), qd_t(1,:)] = wse_dep(q_t(1,:), qd_t(1,:));
   
   event = 'none';
   current = 1;
   while (event == 'none')
     wse_rk4;
     wse_evd;
   end
   %mirror leg 1 and leg 2:
   q_t(current,3:4)  = [ q_t(current,4)  q_t(current,3)];
   qd_t(current,3:4) = [qd_t(current,4) qd_t(current,3)];
   mode = startmode;
   
   v_end(i,:) = [q_t(current,3), qd_t(current,3), qd_t(current,4)];
 end
 
 v_difference = v_end(1,:) - v_begin(1,:);
 J = (v_end(2:4,:) - [v_end(1,:);v_end(1,:);v_end(1,:)])/pert;
 delta_v = inv(eye(3)-J.')*v_difference.';
 v_begin(1,:) = v_begin(1,:) + delta_v.';
 epsilon  = sqrt(v_difference*v_difference.');
 disp([' error between initial state and end state = ', num2str(epsilon)])
end

if (epsilon<=accuracy)
    disp('.')
    if max(abs(eig(J.')))<1
        disp(['Stable fixed point found; max(|eig(J)|) = ', num2str(max(abs(eig(J.'))))])        
    else
        disp(['Untable fixed point found; max(|eig(J)|) = ', num2str(max(abs(eig(J.'))))])        
    end
    disp('% independent initial conditions')
    disp(['phi1  = ', num2str(v_begin(1,1)), ';  % counter-clockwise rotation of leg 1'])
    disp(['phi1d = ', num2str(v_begin(1,2)), ';  % velocity of counter-clockwise rotation of leg 1'])
    disp(['phi2d = ', num2str(v_begin(1,3)), ';  % velocity of counter-clockwise rotation of leg 2'])
else
    disp('No fixed point found')
end
disp(' ')
disp(' ')