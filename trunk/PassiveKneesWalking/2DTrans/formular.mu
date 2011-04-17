y_h:=(l-r)*cos(theta1)+r;
x_h:=(l-r)*sin(theta1)-r*(theta1-thetaAtt);
c1:=cos(theta1);
s1:=sin(theta1);
trans_t1:=matrix([[c1, -s1], [s1,c1]]);
ph:=matrix([xh, yh]);
pm:=matrix([-c,w]);



//m1_l:=ph+trans_t1*pm





