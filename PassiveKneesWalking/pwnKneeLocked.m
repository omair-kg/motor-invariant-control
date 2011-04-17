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

	H2(1,1)=ms*a1*a1+mt*(ls+a2)*(ls+a2)+(mh+ms+mt)*l*l;
	H2(1,2)=-(mt*b2+ms*(lt+b1))*l*cos(q2-q1);
	H2(2,1)=H2(1,2);
	H2(2,2)=mt*b2*b2+ms*(lt+b1)*(lt+b1);

	B2=zeros(2,2);
	h=-(mt*b2+ms*(lt+b1))*l*sin(q1-q2);
	B2(2,1)=h*dq2;
	B2(1,2)=-h*dq1;


	G2(1,1)=-(ms*a1+mt*(ls+a2)+(mh+mt+ms)*l)*g*sin(q1);
	G2(2,1)=(mt*b2+ms*(lt+b1))*g*sin(q2);

	ddqp= H2\(-1*B2*qd-G2);

	
	dx(1:3)=x(4:6);
	dx(4:5)=ddqp;
	dx(6)=ddqp(2);
end
