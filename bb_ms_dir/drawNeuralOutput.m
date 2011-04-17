figure
plot(tout,yout(:,5))
hold on
load par_orig
plot(tout,yout(:,5),'r')
load par_no_couple
plot(tout,yout(:,5),'g')
load par_increase_sensive
plot(tout,yout(:,5),'m')

