function dx=pwnKneefree(t,x)
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
global SlopeAction
global SpeedAction
global SslopeAction;
global SspeedAction;


	q=x(1:3);
	q1=x(1);
	q2=x(2);
	q3=x(3);
	
	qd=x(4:6);
	dq1=qd(1);
	dq2=qd(2);
	dq3=qd(3);


	dx=zeros(6,1);
	%nx=x(9:12);

	H3(1,1)=ms*a1*a1+mt*(ls+a2)*(ls+a2)+(mh+ms+mt)*l*l;
	H3(1,2)=-(mt*b2+ms*lt)*l*cos(q2-q1);
	H3(1,3)=-ms*b1*l*cos(q3-q1);
		
	H3(2,1)=H3(1,2);
	H3(2,2)=mt*b2*b2+ms*lt*lt;
	H3(2,3)=ms*lt*b1*cos(q3-q2);
	
	H3(3,1)=H3(1,3);
	H3(3,2)=H3(2,3);
	H3(3,3)=ms*b1*b1;



	B3=zeros(3,3);
	
	h122 =-(mt*b2+ms*lt)*l*sin(q1-q2);
	h133=-ms*b1*l*sin(q1-q3);

	h211=-h122;
	h233=ms*lt*b1*sin(q3-q2);

	h311=-h133;
	h322=-h233;

	B3(1,2)=h122*dq2;
	B3(1,3)=h133*dq3;

	B3(2,1)=h211*dq1;
	B3(2,3)=h233*dq3;

	B3(3,1)=h311*dq1;
	B3(3,2)=h322*dq2;
	
	G3=zeros(3,1);

	G3(1,1)=-(ms*a1+mt*(ls+a2)*(ls*a2)+(mh+ms+mt)*l)*g*sin(q1);
	G3(2,1)=(mt*b2+ms*lt)*g*sin(q2);
	G3(3,1)=ms*b1*g*sin(q3);
	

	sa=SpeedAction*SpeedAction;
	GSpeedAction=zeros(3,1);
	GSpeedAction(1,1)=-(ms*a1+mt*(ls+a2)*(ls*a2)+(mh+ms+mt)*l)*g*sin(q1)*sa;
	GSpeedAction(2,1)=(mt*b2+ms*lt)*g*sin(q2)*sa;
	GSpeedAction(3,1)=ms*b1*g*sin(q3)*sa;
	uSpeedAction=GSpeedAction-G3;
	uSpeedAction=uSpeedAction.*SspeedAction;

	

	SslopeAction;

	GSlopeAction=zeros(3,1);
	GSlopeAction(1,1)=-(ms*a1+mt*(ls+a2)*(ls*a2)+(mh+ms+mt)*l)*g*sin(q1-SlopeAction)*sa;
	GSlopeAction(2,1)=(mt*b2+ms*lt)*g*sin(q2-SlopeAction)*sa;
	GSlopeAction(3,1)=ms*b1*g*sin(q3-SlopeAction)*sa;
	uSlopeAction=GSlopeAction-GSpeedAction;
	uSlopeAction=uSlopeAction.*SslopeAction;

	ddqp= H3\(-B3*qd-(uSlopeAction+uSpeedAction+G3));
	

	%dx(9:12)=os(t,nx);
	dx(1:3)=qd;
	dx(4:6)=ddqp;
end
