function dxn=os(t,xn)
	global B C R TA1 TA2 H HO
	global SINPUT SOUT
	global mode
	global SpeedAction
	
	timeScale=1.4*1.2*1.33;
	timeScale=timeScale/SpeedAction;

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
	
	SOUT=HO*(mx1-mx2)*mode*SpeedAction*SpeedAction;
	
end
