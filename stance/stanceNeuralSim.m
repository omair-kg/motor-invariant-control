function dx=stanceNeuralSim(t,x)
global SINPUT
SINPUT=x(1)
dx=zeros(6,1);
nx=x(3:6);
dx(3:6)=os(t,nx);
dx(1:2)=stanceSim(t,x(1:2));
end


function dy=stanceSim(t,y)
global alpha;
global L;
global m;
global g;
global yL;
global yR;
global a;
global b;
global Ed;
global K;
global SOUT
global SpeedAction
global W
global gamma
us=SOUT
dy=zeros(2,1);

ys=y(1)-(yL+yR)/2;
u=-g/L*alpha*y(1)*SpeedAction*SpeedAction;
u=u+g/L*alpha*y(1);
dy(1)=y(2);
if(abs(y(1))<(gamma*W))
	dy(2)=-g/L*alpha*y(1)+u+us;
else
	dy(2)=g/L*y(1)+u+us
end
end

