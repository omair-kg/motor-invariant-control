% Walkin Simulation Example - Initial Conditions
%     for Matlab 5.2 and up
%
%
% This file sets the initial conditions for a simulation
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

walk_transCfg
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


test_data={}
stepcount=10;
failed=false;
for i=1:stepcount;
	option=odeset('Events',@walk_transEvent2,'MaxStep',0.01);
	[T,Y,te,ye,ie]=ode45(@walk_trans,[t_start,t_end],X0,option);

	nt=length(T);
	tout=[tout;T(2:nt)];
	yout=[yout;Y(2:nt,:)];
	teout=[teout;te];
	yeout=[yeout;ye];
	ieout=[ieout;ie];
	
	if ie>1
		failed=true;	
		break;
	end
	
	walk_transImpact;
	
	X0=Y(nt,:);
	X0([1:4])=q_new;
	X0([5:8])=qd_new;
	t_start=T(nt);
	if t_start==t_end
		break
	end
end


%walk_neuralAnim


test_data{1}=tout;
test_data{2}=yout;
test_data{3}=teout;
test_data{4}=yeout;
walk_transManyplot(test_data);

if(failed)
	'Walk has Failed'
end





