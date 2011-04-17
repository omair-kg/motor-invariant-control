clear
%global INIT_CONDITION
global TIME_SPAN
bb_ms_osCfg

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



for i=1:50
	option=odeset('Events',@bb_ms_osEvent,'MaxStep',0.01);
    	[T,Y,te,ye,ie]=ode45(@bb_ms_os,[t_start,t_end],X0,option);
	
	nt=length(T);
	tout=[tout;T(2:nt)];
	yout=[yout;Y(2:nt,:)];
	X0=Y(nt,:)

	ballspeed=Y(nt,2);

	t_d=0.02

	ti=T(1):0.01:T(nt);
	yi=interp1(T,Y,ti);
	last=size(yi,1)
	mp_d=yi(last-1,7:8)
	mp_d=max(mp_d,0)
	mp_d=mp_d*HO
	mp_d=mp_d(1)-mp_d(2)
	massspeed=(SOUT-mp_d)/t_d
	

	
	
	t_start=T(nt);
	if (t_start==t_end)
		'end of loop'   
	break
	end


	ballspeed;
	massspeed;


	impulse = -(0.9)*(ballspeed-massspeed)
	%X0(2)=-(0.9)*ballspeed;	
	%impulse=-(1.0)*ballspeed;
		
	if impulse<0.1
		'small impulse'
		break
	end
	
	X0(2)=impulse+massspeed
	%X0(4)=massspeed
	
	%X0(2)=impulse+1/Ratio*ballspeed+massspeed;
	%X0(2)=X0(2)/(1+1/Ratio);
	%X0(4)=-impulse+Ratio*massspeed+ballspeed;
	%X0(4)=X0(4)/(Ratio+1);
end

test_data{1}=tout;
test_data{2}=yout;

bb_ms_osManyPlot(test_data);

