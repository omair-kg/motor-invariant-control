function xdot=msno(t,x)
global B C R TA1 TA2 H HO
global K D
global TURN
TURN=0.01*t
xdot=zeros(6,1);
i=x(1)-TURN;
%i=0;
pi=max([i,0]);
ni=max([-i,0]);
x1=x(3);
x2=x(4);
v1=x(5);
v2=x(6);



mx1=max([0,x1]);
mx2=max([0,x2]);

xdot(3)=C-x1-B*v1-R*mx2-H*pi;
xdot(3)=xdot(3)/TA1;
xdot(4)=C-x2-B*v2-R*mx1-H*ni;
xdot(4)=xdot(4)/TA1;

xdot(5)=(mx1-v1)/TA2;
xdot(6)=(mx2-v2)/TA2;

%zp=0;
zp=HO*(mx1-mx2);
xdot(1)=x(2);
xdot(2)=-K*(x(1)-zp-TURN)-D*x(2);
end
