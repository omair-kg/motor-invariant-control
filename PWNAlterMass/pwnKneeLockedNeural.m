function dx=pwnKneeLockedNeural(t,x)
	global  SINPUT
	
	SINPUT=x(1)-x(2);	
	dx=zeros(10,1);

	q=x(1:3);
	dq=x(4:6);

	nx=x(7:10);
	dx(7:10)=os(t,nx);
	dx(1:6)=pwnKneeLocked(t,x)

end

function dx=pwnKneeLocked(t,x)
global mh;
global mt;
global ms;
global a1;
global b1;
global a2;
global b2;
global ls;
global lt;
global l;
global g;
global SOUT;
global MHStance
global MTStance
global MSStance


	

	q=x(1:2);	
	qd=x(4:5);
	qd=qd(:);

	q1=q(1);
	q2=q(2);

	dq1=qd(1);
	dq2=qd(2);
	
	


	dx=zeros(6,1);
	%nx=x(9:12);

	H2=zeros(2,2);
	B2=zeros(2,2);
	G2=zeros(2,1);

	H2(1,1)=MSStance*a1*a1+MTStance*(ls+a2)*(ls+a2)+(MHStance+ms+mt)*l*l;
	H2(1,2)=-(mt*b2+ms*(lt+b1))*l*cos(q2-q1);
	H2(2,1)=H2(1,2);
	H2(2,2)=mt*b2*b2+ms*(lt+b1)*(lt+b1);

	B2=zeros(2,2);
	h=-(mt*b2+ms*(lt+b1))*l*sin(q1-q2);
	B2(2,1)=h*dq2;
	B2(1,2)=-h*dq1;


	G2(1,1)=-(MSStance*a1+MTStance*(ls+a2)+(MHStance+mt+ms)*l)*g*sin(q1);
	G2(2,1)=(mt*b2+ms*(lt+b1))*g*sin(q2);
	U2=[1,-1]'*SOUT

	ddqp= H2\(-1*B2*qd-G2+U2);

	
	dx(1:3)=x(4:6);
	dx(4:5)=ddqp;
	dx(6)=ddqp(2);
end

function dxn=os(t,xn)
	global B C R TA1 TA2 H HO
	global SINPUT SOUT
	global mode
	
	timeScale=1.4*1.2;

	i=SINPUT*mode;
	pi=max([i,0]);
	ni=max([-i,0]);
	
	dxn=zeros(4,1);
	x1=xn(1);
	x2=xn(2);
	v1=xn(3);
	v2=xn(4);


	mx1=max([0,x1]);
	mx2=max([0,x2]);

	dxn(1)=C-x1-B*v1-R*mx2-H*pi;
	dxn(2)=C-x2-B*v2-R*mx1-H*ni;

	
	dxn(1)=dxn(1)/(TA1*timeScale);
	dxn(2)=dxn(2)/(TA1*timeScale);

	dxn(3)=(mx1-v1)/(TA2*timeScale);
	dxn(4)=(mx2-v2)/(TA2*timeScale);	
	
	SOUT=HO*(mx1-mx2)*mode;
	
end
