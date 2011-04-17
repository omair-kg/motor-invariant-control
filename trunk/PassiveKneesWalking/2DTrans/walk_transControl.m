function control=walk_transControl(thetaStance,thetaSwing)
global GRAVITY;
global l1
global l2
global r1
global r2
global w1
global w2
global c1
global c2
global m1
global m2
global gamma

global gammaref;
gammaref=-0.01;



gvt=GRAVITY;
g_1=gammaref;
g_2=-gamma;



% two leg configuration are the same
l=l1;
r=r1;
c=c1;
w=w1;
d=l-r;

graddiff = zeros(2,1);


graddiff(2,1) = -gvt*m2*(cos(g_1)*(c*cos(thetaSwing)+w*sin(thetaSwing))-sin(g_1)*(c*sin(thetaSwing)-w*cos(thetaSwing)))+...
		gvt*m2*(cos(g_2)*(c*cos(thetaSwing)+w*sin(thetaSwing))-sin(g_2)*(c*sin(thetaSwing)-w*cos(thetaSwing)));
graddiff(1,1) = -gvt*m1*(cos(g_1)*...
			(c*cos(thetaStance)+d*sin(thetaStance)+w*sin(thetaStance))+...
			sin(g_1)*(r+d*cos(thetaStance)-c*sin(thetaStance)+w*cos(thetaStance)))+...
			gvt*m1*(cos(g_2)*(c*cos(thetaStance)+d*sin(thetaStance)+w*sin(thetaStance))+...
			sin(g_2)*(r+d*cos(thetaStance)-c*sin(thetaStance)+w*cos(thetaStance)))-...
			gvt*m2*(sin(g_1)*(r+d*cos(thetaStance))+d*cos(g_1)*sin(thetaStance))+...
			gvt*m2*(sin(g_2)*(r+d*cos(thetaStance))+d*cos(g_2)*sin(thetaStance));



control=graddiff;

