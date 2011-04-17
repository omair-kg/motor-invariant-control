syms l 
syms c
syms theta1
syms theta2
syms thetaAtt;

syms ga1
syms ga2

syms r
syms w
syms xf

yh=(l-r)*cos(theta1)+r;
xh=-(l-r)*sin(theta1)-r*(theta1-thetaAtt);


t1trans=[cos(theta1) -sin(theta1);cos(theta1) sin(theta1)]
t2trans=[cos(theta2) -sin(theta2);cos(theta2) sin(theta2)]

wtrans1=[cos(ga1) -sin(ga1);cos(ga1),sin(ga1)]
wtrans2=[cos(ga2) -sin(ga2);cos(ga2),sin(ga2)]


m1l=[xh;yh]+t1trans*[-c;w];
m1w1=wtrans1*m1l;
m1w2=wtrans2*m1l;

m2l=[xh;yh]+t2trans*[-c;w];
m2w1=wtrans1*m2l;
m2w2=wtrans2*m2l;

vw1=m1w1(2)+m2w1(2);
vw2=m1w2(2)+m2w2(2);



diff_v=vw1-vw2
dtheta=[theta1 theta2]
diff=jacobian(diff_v,dtheta)


