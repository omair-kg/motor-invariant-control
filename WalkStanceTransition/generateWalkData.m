mh=0.5*a;
mt=0.5;
ms=0.1*mt;



a1=0.375*2/(1+r);
b1=0.125*2/(1+r);

a2=0.175*2*r/(1+r);
b2=0.325*2*r/(1+r);


ls=a1+b1;
lt=a2+b2;
l=ls+lt;


MHStance=mh
MTStance=mt*2*b/(1+b)
MSStance=ms*2*b/(1+b)

mt=2*mt/(1+b)
ms=2*ms/(1+b)

IPosTable=ITables(:,1)-ITables(:,2)
ISpeedTables=ITables(:,5)./ITables(:,4)

is=ISpeedTables(indx)


dq1=qref(4)
dq2=qref(4)*is*speedScale
dq3=qref(4)*is*speedScale

INI_CON=[q1,q2,q3,dq1,dq2,dq3]
OS_INI_CON=qref(7:10)

gamma2=qref(1)+qref(2)+2*SlopeChange;
gamma=0.5*gamma2;



X0=[INI_CON,OS_INI_CON]
Ts=TIME_SPAN


teout=[]
yeout=[]
ieout=[]
yout=[]
tout=[]


mode=1

t_start=Ts(1)
t_end=Ts(2)
tout=t_start;

yout=X0;

failed=false;
Rgamma = [cos(gamma), -sin(gamma);
          sin(gamma),  cos(gamma)];

test_data={}

dis=0;

trans=[cos(yout(:,1)),sin(yout(:,1))]*[0 l;-l 0]
qout=[yout(1),yout(1),yout(2),yout(3),trans,yout(4),yout(4),yout(5),yout(6),yout(7),yout(8),yout(9),yout(10)]


for i=1:stepcount;
	option=odeset('Events',@pwnKneeEvent,'MaxStep',0.01);
	[T,Y,te,ye,ie]=ode45(@pwnKneefreeNeural,[t_start,t_end],X0,option);

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
	[T,Y,te,ye,ie]=ode45(@pwnKneeLockedNeural,[t_start,t_end],X0,option);

	nt=length(T);
	tout=[tout;T(2:nt)];
	yout=[yout;Y(2:nt,:)];
	
	
	teout=[teout;te];
	yeout=[yeout;ye];
	ieout=[ieout;ie];
	
		
	X0=Y(nt,:);
	yTrans=X0;

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
		qout=[qout;yout(2:end,1),yout(2:end,1),yout(2:end,2),yout(2:end,3),trans(2:end,:),yout(2:end,4),yout(2:end,4),yout(2:end,5),yout(2:end,6),yout(2:end,7),yout(2:end,8),yout(2:end,9),yout(2:end,10)];
		
	else
		'right'
		qout=[qout;yout(2:end,2),yout(2:end,3),yout(2:end,1),yout(2:end,1),trans(2:end,:),yout(2:end,5),yout(2:end,6),yout(2:end,4),yout(2:end,4),yout(2:end,7),yout(2:end,8),yout(2:end,9),yout(2:end,10)];
	end
	angle=0.5*(q_new(1)-q_new(2))
	dis=dis+2*l*sin(angle);
	yout=X0
	mode=-mode
	switchmass	
end

