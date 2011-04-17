function ss=w2sTransform(l,q,dq)
ss=zeros(4,1);
x=0;
y=cos(q);
dx=-l*cos(q)*dq;
dy=-l*sin(q)*dq;
ss(1)=x;
ss(2)=dx;
ss(3)=y;
ss(4)=dy;
end
