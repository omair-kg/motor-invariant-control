% Walking Simulation Example - Event Detection
%     for Matlab 5.2 and up
%
%
% This file detects the occurrence of heelstrike and interpolates between to 
% subsequent states to find the exact time of impact. Then the impact calculation
% is performed (calling swe_eom.m).
% If heelstrike is detected, the event flag is set to 'hstr'
% However, if heelstrike has resulted in a negative swing foot velocity, the
% impact model was not correct; the hind foot should have remained in contact
% with the floor resulting in a full stop. Therefore, the resultant velocities are
% reset to zero, and the event flag is set to 'stop'. The simulation should be stopped.
%
% This file also detects 'running' when the vertical contact force becomes a tension force
% The simulation is not build for that, so all states are reset to zero and the 
% event flag is set to 'tens'(tension contact force). The simulation should be stopped. 
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

event = 'none';

% Heel strike detection. This is a complex decision since it should not
% react to 'foot-scuffing' in mid-stance phase, which is unavoidable because
% the legs (supposedly) have the same length and cannot be shortened during the swing phase.
% For prototypes, we solve this by letting them walk on stepping stones, so that
% there is indeed a hole in the floor that the swing foot can go through. Of course,
% a model with knees would also solve this problem.

switch mode
case 'stance phase leg 1'
   
if (g_t(current,4)*g_t(current-1,4)) < 0	      % if the swing foot has passed floor level
 if (q_t(current-1,3)*qd_t(current-1,3)) > 0    % and the stance leg has passed vertical position
  if g_t(current,4) < 0                         % and the floor pass was actually downward
   if q_t(current-1,3)*(q_t(current-1,4)) < 0   % and the leg angles have opposite signs
    event = 'hstr';                             %     THEN heel strike has occurred
    wse_int;  % interpolate to exact instant of contact
    mode = 'heel strike leg 2';    
    wse_imp;  % apply impact equations
    mode = 'stance phase leg 2';
    % Impact calculations are completed. Now check vertical velocity of new swing leg
    gd = wse_mat('D1', q_t(current,:), qd_t(current,:))*qd_t(current,:).';
    if gd(2) < 0
     % apparently the former stance foot should not have lost contact: impact calculation
     % was incorrect and results must be replaced by bringing the machine to a full stop
     event = 'stop';
     qd_t(current, :) = [0 0 0 0];
     impacts(size(impacts,1), 2:5) = [0 0 0 0]; % this is not true, but we don't have the correct numbers
%     for i = current:totallength, q_t(i, :) = q_t(current, :);  end
    end
   end
  end
 end
end
   
   
case 'stance phase leg 2'
if (g_t(current,2)*g_t(current-1,2)) < 0	      % if the swing foot has passed floor level
 if (q_t(current-1,4)*qd_t(current-1,4)) > 0    % and the stance leg has passed vertical position
  if g_t(current,2) < 0                         % and the floor pass was actually downward
   if q_t(current-1,4)*(q_t(current-1,3)) < 0   % and the leg angles have opposite signs
    event = 'hstr';                             %     THEN heel strike has occurred
    wse_int;  % interpolate to exact instant of contact
    mode = 'heel strike leg 1';    
    wse_imp;  % apply impact equations
    mode = 'stance phase leg 1';
    % Impact calculations are completed. Now check vertical velocity of new swing leg
    gd = wse_mat('D2', q_t(current,:), qd_t(current,:))*qd_t(current,:).';
    if gd(2) < 0
     % apparently the former stance foot should not have lost contact: impact calculation
     % was incorrect and results must be replaced by bringing the machine to a full stop
     event = 'stop'
     qd_t(current, :) = [0 0 0 0];
     impacts(size(impacts,1), 2:5) = [0 0 0 0]; % this is not true, but we don't have the correct numbers
%     for i = current:totallength, q_t(i, :) = q_t(current, :);  end
    end
   end
  end
 end
end
   
   
   
end


% failure checking
if event == 'none',
 if (q_t(current, 3)>1)|(q_t(current, 4)>1), % checks if phi1 or phi2 are larger than +60 degrees
  event = 'back'
 end
 if (q_t(current, 3)<-1)|(q_t(current, 4)<-1), % checks if phi1 or phi2 are smaller than -60 degrees
  event = 'forw'
 end
 if (f_t(current-1, 2) > 0)|(f_t(current-1, 4) > 0),
  event = 'tens'
 end
end