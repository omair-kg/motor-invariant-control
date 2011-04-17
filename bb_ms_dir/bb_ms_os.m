function dx=bb_ms_os(t,x)
	global  SINPUT SOUT
	global model

	bx=x(1:2);
	mx=x(3:4);
	nx=x(5:8);
	dx=zeros(8,1);

	SINPUT=x(2);

	dx(5:8)=os(t,nx);
	mx(1)=mx(1)-SOUT;	
	dx(3:4)=ms(t,mx);
	dx(1:2)=bb(t,bx);
	
end


function dxb=bb(t,xb)
	global GRAVITY
	dxb=zeros(2,1);
	dxb(1)=xb(2);
	dxb(2)=-GRAVITY;
end

function dxm=ms(t,xm)
	global K  D
	dxm=zeros(2,1);
	dxm(1)=xm(2);
	dxm(2)=-K*xm(1)-D*xm(2);
end

function dxn=os(t,xn)
	global B C R TA1 TA2 H HO
	global SINPUT SOUT
	

	i=SINPUT;
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
	dxn(1)=dxn(1)/TA1;
	dxn(2)=C-x2-B*v2-R*mx1-H*ni;
	dxn(2)=dxn(2)/TA1;

	dxn(3)=(mx1-v1)/TA2;
	dxn(4)=(mx2-v2)/TA2;	
	
	SOUT=HO*(mx1-mx2);
	
end
