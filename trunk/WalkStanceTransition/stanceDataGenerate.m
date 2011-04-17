global yL
global yR


d=1/2*W+(1-gamma)*W
gamma=0.5;
alpha=(1-gamma)/gamma;
L=sqrt(leg^2-(0.5*W+gamma*W)^2);
options=odeset('Events',@pendevent);
[T,Y]=ode45(@stanceNeuralSim,TIME_SPAN,INI_CON,options);


