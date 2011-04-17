% Walkin Simulation Example - Initial Conditions
%     for Matlab 5.2 and up
%
%
% This file sets the initial conditions for a simulation
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology
clear all


pwnCfg
X0=[INI_CON,OS_INI_CON]
Ts=TIME_SPAN
stepcount=45;


teout=[]
yeout=[]
ieout=[]
yout=[]
tout=[]
qrefout=[];

global originalX;
global originalY;
global tempX;
global tempY;
originalX=0;
originalY=0;

mode=1

t_start=Ts(1)
t_end=Ts(2)
tout=t_start;
yout=X0;
failed=false;
Rgamma = [cos(gamma), -sin(gamma);
          sin(gamma),  cos(gamma)];





trans=[cos(yout(:,1)),sin(yout(:,1))]*[0 l;-l 0]
qout=[yout(1),yout(1),yout(2),yout(3),trans,yout(4),yout(4),yout(5),yout(6),yout(7),yout(8),yout(9),yout(10)]
qrefout=[yout([1 1 2 3])-SlopeAction,yout([4 4 5 6])/SpeedAction]


for i=1:stepcount;
	
	'step---------------------------'
	
	i
	'guess step control parameters-----------------------'
	
	q1=yout(1);
	q2=yout(2);
	ipos=q1-q2;
	IPos;
	

	dq1=yout(4);
	dq2=yout(5);
	ispeed=dq2/dq1;
	ISpeed;

	[sl,sp]=GetNextStepControl([originalX,originalY],WALKING_INDEX,ipos,dq1,dq2)
	

	SlopeAction=sl	
 	SpeedAction=sp

	if(i==stepcount)
	break
	end
	
 
	

	'start walking---------------------'
	option=odeset('Events',@pwnKneeEvent,'MaxStep',0.01);
	[T,Y,te,ye,ie]=ode45(@pwnKneefreeNeural,[t_start,t_end],X0,option);

	nt=length(T);
	tout=[tout;T(2:nt)];
	yout=[yout;Y(2:nt,:)];

	
	teout=[teout;te];
	yeout=[yeout;ye];
	ieout=[ieout;ie];
	
	


	'knee strike'
	
	X0=Y(nt,:);
	[q_new,qd_new]=pwnKneeImpact(X0(1:3),X0(4:6));
	X0([1:3])=q_new;
	X0([4:6])=qd_new;
	t_start=T(nt);

	output






	'kneel locked--------------------------------'
	option=odeset('Events',@pwnHeelStrikeEvent,'MaxStep',0.01);
	[T,Y,te,ye,ie]=ode45(@pwnKneeLockedNeural,[t_start,t_end],X0,option);

	nt=length(T);
	tout=[tout;T(2:nt)];
	yout=[yout;Y(2:nt,:)];
	
	
	teout=[teout;te];
	yeout=[yeout;ye];
	ieout=[ieout;ie];
	
		
	X0=Y(nt,:);

	'knee strike'
	[q_new,qd_new]=pwnHeelImpact(X0(1:3),X0(4:6));
	X0(1:3)=q_new;
	X0(4:6)=qd_new;	
	t_start=T(nt);
	%{
	ori=[originalX;originalY]
	trans=[cos(yout(:,1)),sin(yout(:,1))]*[0 l;-l 0];
	trans=[trans(:,1)+ori(1),trans(:,2)+ori(2)];
	
	if(mod(i,2)==1)
		'left'
		qout=[qout;yout(2:end,1),yout(2:end,1),yout(2:end,2),yout(2:end,3),trans(2:end,:),yout(2:end,4),yout(2:end,4),yout(2:end,5),yout(2:end,6),yout(2:end,7),yout(2:end,8),yout(2:end,9),yout(2:end,10)];
		
	else
		'right'
		qout=[qout;yout(2:end,2),yout(2:end,3),yout(2:end,1),yout(2:end,1),trans(2:end,:),yout(2:end,5),yout(2:end,6),yout(2:end,4),yout(2:end,4),yout(2:end,7),yout(2:end,8),yout(2:end,9),yout(2:end,10)];
	end
	%}
	output

	
	mode=-mode
	originalX=tempX;
	originalY=tempY;
	
	
end
i

plot(qrefout(:,1),qrefout(:,5))

hold on
plot(qrefout(1,1),qrefout(1,5),'rx')
hold off



