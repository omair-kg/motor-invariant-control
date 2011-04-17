% Walking Simulation Example - Impact pre- and postprocessing
%     for Matlab 5.2 and up
%
%
% This file does pre- and post-processing for the impact calculations for heel strike.
% For the actual impact calculation, the file 'wse_eom.m' is called.
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

current = current + 1;
impacts(size(impacts,1)+1,1) = current;
t_t(current) = t_t(current-1);
switch mode
case 'heel strike leg 1'
   footholds(1) = footholds(1) + g_t(current-1,1);
case 'heel strike leg 2'
   footholds(2) = footholds(2) + g_t(current-1,3);
end   
[qd_t(current, :), impacts(size(impacts,1), 2:5)] = wse_eom(q_t(current-1,:), qd_t(current-1,:), mode);

q_t(current, :) = q_t(current-1, :);
g_t(current, :) = [wse_mat('g1', q_t(current,:), qd_t(current,:)); wse_mat('g2', q_t(current,:), qd_t(current,:))].';
xf_t(current, :) = footholds;

