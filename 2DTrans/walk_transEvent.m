function [value,isterminal,direction] = walk_transEvent(t,y)
% Locate the time when height passes through zero in a 
% decreasing direction and stop integration.
global mode;
event = 'none';
mode;
value =[wse_mat('g1',y(1:4),y(5:8)); wse_mat('g2',y(1:4),y(5:8))];

nag=0;
if y(3)*y(4)>=0
	nag=1;
end


switch mode
case 'stance phase leg 1'
	if(y(3)>0)
	  nag=1	;
  	end
      
case 'stance phase leg 2'
	if(y(4)>0)
		nag=1;
	end
end

if nag==1
	value=1;
	isterminal=1;
	direction=1;
	return
end


% Heel strike detection. This is a complex decision since it should not
% react to 'foot-scuffing' in mid-stance phase, which is unavoidable because
% the legs (supposedly) have the same length and cannot be shortened during the swing phase.
% For prototypes, we solve this by letting them walk on stepping stones, so that
% there is indeed a hole in the floor that the swing foot can go through. Of course,
% a model with knees would also solve this problem.

switch mode
case 'stance phase leg 1'
  	
  	   value=value(4);
  	   isterminal=1;
  	   direction= -1;
      
case 'stance phase leg 2'
     value=value(2);
     isterminal=1;
     direction= -1;
end

% failure checking
%if event == 'none',
 %if (q_t(current, 3)>1)|(q_t(current, 4)>1), % checks if phi1 or phi2 are larger than +60 degrees
  %event = 'back'
 %end
 %if (q_t(current, 3)<-1)|(q_t(current, 4)<-1), % checks if phi1 or phi2 are smaller than -60 degrees
  %event = 'forw'
 %end
 %if (f_t(current-1, 2) > 0)|(f_t(current-1, 4) > 0),
  %event = 'tens'
 %end
%end

end
