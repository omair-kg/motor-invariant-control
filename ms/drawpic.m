load phaseShiftData
f=@(x,p) plot(ti,data{x}(:,1),p)
figure
hold on
f(1,'r')
f(2,'g')
f(3,'b')
f(4,'k')
title('Phase Offset')
legend('0 offset','1 offset','2 offset','3 offset')
xlabel('time')
ylabel('position')
axis off
saveas (gca,'phaseShift.eps','psc2')
hold off


