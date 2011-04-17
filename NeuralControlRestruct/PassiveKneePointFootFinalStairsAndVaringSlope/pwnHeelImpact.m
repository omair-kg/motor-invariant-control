function [qp,dqp]=pwnHeelImpact(q,dq)
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
global Q22m;
global Q22p;



qp=zeros(3,1);
dqp=zeros(3,1);
q=q(1:2);
q=q(:);

dq=dq(1:2)
dq=dq(:)


qp=[0 1;1 0;1 0]*q;


q1=q(1);
q2=q(2);
cal=cos(q1-q2)

Q22m=zeros(2,2);

Q22m(1,2)= -ms*a1*(lt+b1)-mt*b2*(ls+a2);
Q22m(1,1)=Q22m(1,2)+(mh*l+2*mt*(a2+ls)+ms*a1)*l*cal;
Q22m(2,1)=Q22m(1,2);
Q22m(2,2)=0;


Q22p=zeros(2,2);

Q22p(2,1)=-(ms*(b1+lt)+mt*b2)*l*cal;
Q22p(2,2)=ms*(lt+b1)*(lt+b1)+mt*b2*b2;
Q22p(1,1)=Q22p(2,1)+(ms+mt+mh)*l*l+ms*a1*a1+mt*(a2+ls)*(a2+ls);
Q22p(1,2)=Q22p(2,1)+ms*(b1+lt)*(b1+lt)+mt*b2*b2;


dqp(1:2,1)=Q22p\Q22m*dq;
dqp(3,1)=dqp(2,1);
end
