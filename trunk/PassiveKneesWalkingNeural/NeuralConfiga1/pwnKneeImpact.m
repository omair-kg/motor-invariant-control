function [qp,dqp]=pwnKneeImpac(q,dq)

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


dq=dq(:);



ls=a1+b1;
lt=a2+b2;
l=ls+lt;


q1=q(1);
q2=q(2);
q3=q(3);




cal=cos(q1-q2);
cbe=cos(q1-q3);
cga=cos(q2-q1);

Q22p=zeros(2,2);
Q23m=zeros(2,3);

Q23m(1,1)=-(ms*lt+mt*b2)*l*cal-ms*b1*cbe+(mt+ms+mh)*l*l+ms*a1*a1+mt*(ls+a2)*(ls+a2);
Q23m(1,2)=-(ms*ls+mt*b2)*l*cal+ms*b1*lt*cga+mt*b2*b2+ms*lt*lt;
Q23m(1,3)=-(ms*b1*l*cbe)+ms*b1*lt*cga+ms*b1*b2;
Q23m(2,1)=-(ms*lt+mt*b2)*l*cal-ms*b1*l*cbe;
Q23m(2,2)=ms*b1*lt*cga+ms*lt*lt+mt*b2*b2;
Q23m(2,3)=ms*b1*lt*cga+ms*b1*b1;


Q22p(2,1)=-(ms*(b1+lt)+mt*b2)*l*cal;
Q22p(2,2)=ms*(lt+b1)*(lt+b1)+mt*b2*b2;
Q22p(1,1)=Q22p(2,1)+mt*(ls+a2)*(ls+a2)+(mh+mt+ms)*l*l+ms*a1*a1;
Q22p(1,2)=Q22p(2,1)+ms*(lt+b1)*(lt+b1)+mt*b2*b2;

qp=q;
dqp(1:2,1)=Q22p\Q23m*dq;
dqp(3,1)=dqp(2,1);
end

