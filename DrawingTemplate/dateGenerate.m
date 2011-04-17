qref=ITables(4,:);
q1=qref(1)+SlopeAction;
q2=qref(2)+SlopeAction;
q3=qref(3)+SlopeAction;


dq1=qref(4)*SpeedAction;
dq2=qref(5)*SpeedAction;
dq3=qref(6)*SpeedAction;


gamma2=q1+q2;
gamma=0.5*gamma2;







ls=a1+b1;
lt=a2+b2;
l=ls+lt;

GRAVITY=9.81;
g=GRAVITY;
TIME_SPAN=[0,2]




INI_CON=[q1,q2,q3,dq1,dq2,dq3]
TIME_SPAN=[0,10]


X0=INI_CON
Ts=TIME_SPAN



teout=[]
yeout=[]
ieout=[]
yout=[]
tout=[]




t_start=Ts(1)
t_end=Ts(2)
tout=t_start;
yout=X0;
failed=false;
Rgamma = [cos(gamma), -sin(gamma);
          sin(gamma),  cos(gamma)];

test_data={}
stepcount=10;
dis=0;

trans=[cos(yout(:,1)),sin(yout(:,1))]*[0 l;-l 0]
qout=[yout(1),yout(1),yout(2),yout(3),trans,yout(4),yout(4),yout(5),yout(6)]


for i=1:stepcount;
	option=odeset('Events',@pwnKneeEvent,'MaxStep',0.01);
	[T,Y,te,ye,ie]=ode45(@pwnKneefree,[t_start,t_end],X0,option);

	nt=length(T);
	tout=[tout;T(2:nt)];
	yout=[yout;Y(2:nt,:)];
	
	teout=[teout;te];
	yeout=[yeout;ye];
	ieout=[ieout;ie];
	
	

	
	
	X0=Y(nt,:);
	[q_new,qd_new]=pwnKneeImpact(X0(1:3),X0(4:6));
	X0([1:3])=q_new;
	X0([4:6])=qd_new;
	t_start=T(nt);
	
	option=odeset('Events',@pwnHeelStrikeEvent,'MaxStep',0.01);
	[T,Y,te,ye,ie]=ode45(@pwnKneeLocked,[t_start,t_end],X0,option);

	nt=length(T);
	tout=[tout;T(2:nt)];
	yout=[yout;Y(2:nt,:)];
	
	
	teout=[teout;te];
	yeout=[yeout;ye];
	ieout=[ieout;ie];
	
		
	X0=Y(nt,:);

	[q_new,qd_new]=pwnHeelImpact(X0(1:3),X0(4:6));
	X0(1:3)=q_new;
	X0(4:6)=qd_new;	
	t_start=T(nt);
	'angle'
	ori=Rgamma*[dis;0];
	trans=[cos(yout(:,1)),sin(yout(:,1))]*[0 l;-l 0];
	trans=[trans(:,1)+ori(1),trans(:,2)+ori(2)];
	
	if(mod(i,2)==1)
		'left'
		qout=[qout;yout(2:end,1),yout(2:end,1),yout(2:end,2),yout(2:end,3),trans(2:end,:),yout(2:end,4),yout(2:end,4),yout(2:end,5),yout(2:end,6)];
	else
		'right'
		qout=[qout;yout(2:end,2),yout(2:end,3),yout(2:end,1),yout(2:end,1),trans(2:end,:),yout(2:end,5),yout(2:end,6),yout(2:end,4),yout(2:end,4)];
	end
	angle=0.5*(q_new(1)-q_new(2))
	dis=dis+2*l*sin(angle);
	yout=X0
	
	
	
end
