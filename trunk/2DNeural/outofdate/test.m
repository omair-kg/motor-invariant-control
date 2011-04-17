walk_neuralCfg
X0=INI_CON

Ts=TIME_SPAN

teout=[]
yeout=[]
ieout=[]
yout=[]
tout=[]
t_start=Ts(1);
t_end=Ts(2);
tout=t_start;
yout=X0;
option=odeset('Events',@walk_neuralEvent,'MaxStep',0.01);
[T,Y,te,ye,ie]=ode45(@walk_neural,[t_start,t_end],X0,option);
    
walk_neuralImpact;  % apply impact equations

