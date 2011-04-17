function [value,isterminal,direction] = pwnKneeEvent(t,y)
	q=y(1:3);
	value=y(2)-y(3);
	isterminal =1;
	direction=-1;
end
