figure
plot(tout,yout(:,1))
hold on
load par_orig
plot(tout,yout(:,1),'r')
load par_no_couple
plot(tout,yout(:,1),'g')
load par_increase_sensive
plot(tout,yout(:,1),'m')


