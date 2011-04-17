function [value,isterminal,direction] = pwnHeelStrikeEvent(t,y)
global gamma;
value=y(1)-gamma+(y(2)-gamma);
isterminal=1;
direction=-1;
end
