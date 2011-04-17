% Walking Simulation Example - Energy CHeck
%     for Matlab 5.2 and up
%
%
% This file checks the energy content of the system
%
%
% Created by Daan Hobbelen, Delft Bio-robotics Laboratory, January 2004
% Delft University of Technology

% parameters
m1 = parleg1(5);
I1 = parleg1(6);
m2 = parleg2(5);
I2 = parleg2(6);

g = parworld(1);
gamma = parworld(2);

M = diag([m1, m1, I1, m2, m2, I2]);
gmat = [eye(3);eye(3)]*[g*sin(gamma);-g*cos(gamma);0];

for i = 1:current
    % calculate positions and velocities centers of mass
    x_t(i,:) = wse_mat('x',q_t(i,:),qd_t(i,:))';
    xd_t(i,:) = (wse_mat('T',q_t(i,:),qd_t(i,:))*qd_t(i,:)')';

    % calculate potential and kinetic energy
    K_t(i,:) = sum(0.5*M*(xd_t(i,:)').^2);
    P_t(i,:) = sum(-M*gmat.*x_t(i,:)');
end

figure
plot(t_t(1:current),K_t(1:current),'b');
hold on;
plot(t_t(1:current),P_t(1:current)-P_t(current),'r');
plot(t_t(1:current),K_t(1:current)+P_t(1:current)-P_t(current),'g');
legend('Kinetic','Potential','Total');


