load Testdata
f=@(x,p) plot(ti,data{x}(:,1),p)
figure
hold on
f(1,'r')
f(2,'g')
f(3,'b')
f(4,'k')
saveas (gca,'phaseShift.eps','psc2')
hold off

figure 
hold on
f2=@(x,p) plot(data{x}(:,1),data{x}(:,2),p)
f2(1,'r')
f2(2,'g')
f2(3,'b')
f2(4,'k')
saveas(gca,'phaseplot.eps','psc2')
hold off
