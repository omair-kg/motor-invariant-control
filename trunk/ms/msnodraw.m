clear
global B C R TA1 TA2 H HO K D



%{
par_orig_data
B=2.0
R=2.0
C=1.0
TA1=1.0
TA2=2.0
H=1
HO=0.1

K=1
D=0.1
%}
%{
not coupled
B=2.0
R=2.0
C=1.0
TA1=1.0
TA2=2*TA1
H=0
HO=0

K=1
D=0.1

%}
%{
only sense
B=2.0
R=2.0
C=1.0
TA1=1.0
TA2=2*TA1
H=1
HO=0

K=1
D=0.1
X0=[1.0, 1.0, 0.1, 0, 0, 0]

%}
%{
par only drive force
B=2.0
R=2.0
C=1.0
TA1=1.0
TA2=2*TA1
H=0
HO=0.1

K=1
D=0.1
%}

%{
par increse drive force
B=2.0
R=2.0
C=1.0
TA1=1.0
TA2=2*TA1
H=1
HO=0.2

K=1
D=0.1
%}
%{
par increase sensitivity
B=2.0
R=2.0
C=1.0
TA1=1.0
TA2=2*TA1
H=1.5
HO=0.2

K=1
D=0.1

%}
%{
increase C
B=2.0
R=2.0
C=2.0
TA1=1.0
TA2=2*TA1
H=1.0
HO=0.1

K=1
D=0.1

%}



B=2.0
R=2.0
C=1.0
TA1=1.3
TA2=2*TA1
H=1
HO=0.1

K=1
D=0.1






X0=[1.0, 1.0, 0.1, 0, 0, 0]


[T,Y]=ode45(@msno,[0,100],X0);

mX1=Y(:,3);
mX2=Y(:,4);
mX1=max([mX1 zeros(size(mX1))]')';
mX2=max([mX2 zeros(size(mX2))]')';
px=mX1-mX2;
py=Y(:,5)-Y(:,6);





subplot(4,2,1:2)
plot(T,Y(:,1:2))

subplot(4,2,3:4)
plot(T,Y(:,3:6))

%phaseplane
subplot(4,2,5)
plot(Y(:,1),Y(:,2))

%phaseplane
subplot(4,2,6)
plot(px,py)

subplot(4,2,7:8)
entrain_data=[px Y(:,1)];
plot(T,entrain_data);






