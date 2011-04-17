% Walking Simulation Example - Simulate Continuous Walking
%     for Matlab 5.2 and up
%
%
% This file uses wse_rk4.m and wse_evd.m which use in turn wse_eom.m and zerocros.m
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

wse_ini;
event = 'none';
totallength = parsim(3);
stepcounter = 0;
while (current < totallength-2) & ((event == 'none')|(event == 'hstr'))
  wse_rk4;
  wse_evd;
  if event=='hstr'
      stepcounter = stepcounter+1;
      disp(['step ', num2str(stepcounter)])
  end
end

wse_fig;