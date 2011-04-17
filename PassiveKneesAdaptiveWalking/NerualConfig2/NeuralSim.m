NeuralCfg
X0=INI_CON
Ts=TIME_SPAN

global qout;
global tout;







t_start=Ts(1);
t_end=Ts(2);





	
[T,Y]=ode45(@NeuralKnee,[t_start,t_end],X0);
	
			




