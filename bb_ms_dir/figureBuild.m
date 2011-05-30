clear all
datapath='data/'
figurepath='figures/BouncingBallPhasePlot'
fcd='figures'
mkdir(fcd)

hs=10
figure
axis([-5 20 -20 20])
hold on
		
		%mkdir([rt,'/',fcd])
		dp=[datapath,'h' num2str(hs) ,'uncoupled'];
		load(dp);
		plot(yout(:,1),yout(:,2));
		plot(yout(1,1),yout(1,2),'bX','LineWidth',2);
		plot(yout(end,1),yout(end,2),'rX','LineWidth',2);
	


xlabel('height| m')
ylabel('velocity|m/s')
hold off
saveas(gca,[figurepath 'uncontrolledDropAt' num2str(hs) '.eps'],'psc2');
close(gcf)

%hold off
 	as=1
	hs=10
	figure
	axis([-5 20 -20 20])
	hold on
	dp=[datapath,'h' num2str(hs) 'a' num2str(as),'c'];
	load(dp);
	plot(yout(:,1),yout(:,2));
	plot(yout(end-1500:end,1),yout(end-1500:end,2),'r','LineWidth',2')
	plot(yout(1,1),yout(1,2),'bX','LineWidth',2);
	plot(yout(end,1),yout(end,2),'rX','LineWidth',2);

	xlabel('height| m')
	ylabel('velocity|m/s')

	hold off
	name=[figurepath 'AppliedCPG' '.eps']
	saveas(gca,[figurepath 'AppliedCPG', '.eps'],'psc2');
	close(gcf)





for as=1:3
	axis([-5 20 -20 20])
	figure
	hold on
	for hs=[5:5:20]
		dp=[datapath,'h' num2str(hs) 'a' num2str(as),'c'];
		load(dp);
		plot(yout(:,1),yout(:,2));
		plot(yout(1,1),yout(1,2),'bX','LineWidth',2);
		plot(yout(end,1),yout(end,2),'rX','LineWidth',2);
	end
	hs=5
	dp=[datapath,'h' num2str(hs) 'a' num2str(as),'c'];
	load(dp);
	plot(yout(end-1500:end,1),yout(end-1500:end,2),'r','LineWidth',2')

	xlabel('height| m')
	ylabel('velocity|m/s')

	hold off
	name=[figurepath 'Action' num2str(as) '.eps']
	saveas(gca,[figurepath 'Action' num2str(as) '.eps'],'psc2');
	close(gcf)

end

%{
%for as=[1:2]
	figure
	hold on
	for hs=[20]
		dp=[datapath,'h' num2str(hs) 'a' num2str(as),'c'];
		load(dp);
		plot(yout(:,1),yout(:,2));
		plot(yout(1,1),yout(1,2),'bX','LineWidth',2);
		plot(yout(end,1),yout(end,2),'rX','LineWidth',2);
	end
	saveas(gca,[figurepath 'Action' num2str(as) '.eps'],'psc2');
	xlabel('height| m')
	ylabel('velocity|m/s')

	hold off
	name=[figurepath 'Action' num2str(as) '.eps']
%	close(gcf)

end
%}
	
