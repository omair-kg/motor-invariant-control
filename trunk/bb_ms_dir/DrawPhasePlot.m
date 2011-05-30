%load data/testdata
function DrawPhasePlot(datapath,figurepath)
load(datapath)
datapath
figurepath
figure
hold on
Tt=0:0.01:10;
%for basin of attraction
%for ib=1:length(testdata)
%plot(testdata{ib}(:,2),testdata{ib}(:,8),'LineWidth',15)
%end
Yy=interp1(tout,qout,Tt);
plot(Yy(:,1),Yy(:,7),'b')
plot(Yy(1,1),Yy(1,7),'bx')
plot(Yy(end-130:end,1),Yy(end-130:end,7),'r','LineWidth',2)
plot(Yy(end-130:end,3),Yy(end-130:end,9),'--r','LineWidth',2)

ylabel('Angle Velocity Of the Red Thigh | rad/s')
xlabel('Angle of the Red Thigh| rad')
hold off
saveas(gca,[figurepath 'pv.eps'],'psc2');
close(gcf)


figure
hold on
plot(Yy(:,1),Yy(:,3),'b')
plot(Yy(1,1),Yy(1,3),'bx')
plot(Yy(end-130:end,1),Yy(end-130:end,3),'r','LineWidth',2)
ylabel('Angle of the Blue Thigh| rad')
xlabel('Angle of the Red Thigh| rad')
axis equal
hold off
saveas(gca,[figurepath 'LR.eps'],'psc2');
close(gcf)


end
