function [value,isterminal,direction] = bb_ms_osEvent(t,y)
% Locate the time when height passes through zero in a 
% decreasing direction and stop integration.


global SOUT
value = y(1)-SOUT;	% Detect pos= 0
%value=y(1);
isterminal = 1;   	% Stop the integration
direction = -1;   	% Negative direction only
end
