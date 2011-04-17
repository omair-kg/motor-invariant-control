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

dy=zeros(2,1);

ys=y(1)-(yL+yR)/2;
%u=m*L*(-a^2/b^2*ys+g/L*alpha*ys+K*y(2)*(Ed-E));
u=0;

dy(1)=y(2);
dy(2)=-g/L*alpha*y(1)+u/(m*L);

end


