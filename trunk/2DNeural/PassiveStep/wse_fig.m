% Walking Simulation Example - FIGures
%     for Matlab 5.2 and up
%
%
% This file outputs the simulation results
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

close all

figure
plot(t_t(1:current),q_t(1:current,3:4))
legend('\phi_1','\phi_2')
hold on
plot(t_t(impacts(:,1)), q_t(impacts(:,1),3:4), '*');
plot(t_t(1), q_t(1,3), '*');
ylabel('rad')
xlabel('sec')
title('Absolute leg angles')
print -deps2 wse_anglefig %produces a figure used in the text "First steps..."

figure
plot(t_t(1:current),g_t(1:current,[2 4])*1000)
legend('g_{y1}','g_{y2}')
ylabel('mm')
xlabel('sec')
title('Foot clearance')
print -deps2 wse_clearancefig %produces a figure used in the text "First steps..."
