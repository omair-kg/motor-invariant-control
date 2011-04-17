	ori=[originalX;originalY]
	trans=[cos(yout(:,1)),sin(yout(:,1))]*[0 l;-l 0];
	trans=[trans(:,1)+ori(1),trans(:,2)+ori(2)];
	
	if(mod(i,2)==1)
		'left'
		qout=[qout;yout(2:end,1),yout(2:end,1),yout(2:end,2),yout(2:end,3),trans(2:end,:),yout(2:end,4),yout(2:end,4),yout(2:end,5),yout(2:end,6),yout(2:end,7),yout(2:end,8),yout(2:end,9),yout(2:end,10)];
		qrefout=[qrefout;yout(2:end,[1 1 2 3])-SlopeAction,yout(2:end,[4 4 5 6])/SpeedAction];
		
	else
		'right'
		qout=[qout;yout(2:end,2),yout(2:end,3),yout(2:end,1),yout(2:end,1),trans(2:end,:),yout(2:end,5),yout(2:end,6),yout(2:end,4),yout(2:end,4),yout(2:end,7),yout(2:end,8),yout(2:end,9),yout(2:end,10)];
		qrefout=[qrefout;yout(2:end,[2 3 1 1 ])-SlopeAction,yout(2:end,[5 6 4 4])/SpeedAction];

	end
	yout=X0
