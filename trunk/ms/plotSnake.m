function plotSnake(data)
l=1
%{
offset=diff(data')';
offsetY=[data(:,1),offset]
offsetY=offsetY;
	
offsetX=sqrt(l*l-offsetY.*offsetY)
offsetX=cumsum(offsetX,2)
%}


offset=diff(data')'
offset=data
angle=offset;
offsetX=cos(angle)*l;
offsetY=sin(angle)*l;
offsetX=cumsum(offsetX,2)
offsetY=cumsum(offsetY,2)

av=sum(data,2);
av=av/8

for i=1:8
data(:,i)=data(:,i)-av;
end

v=gradient(data')';
v=sum(abs(v),2);
v=v
animationfig = figure;
%   'Position',[0 0.0273438 1 0.935547],...

set(animationfig,...
   'Name', 'Animation',...
   'Units','normalized',...
   'RendererMode','auto',...
   'Renderer','OpenGl',...
   'Color',[1 1 1],...
   'Visible','off');
AxesHandle=axes; 
set(AxesHandle,...
   	'Parent',animationfig,...
	'Position',[0 0 1 1])
%	'Ylim',[-10,30],...
%   	'Xlim',[0 100]);
snake=line;
set(snake,...
   'Parent',AxesHandle,...
   'Color',[0 0 1],...
   'LineWidth',1,...
   'Marker','X')

axis equal
hold on

orig=[0;0]
for i=1:length(data)
	orig=orig+v(i)*[cos(av(i));sin(av(i))]*0.2;	
	offsetX(i,:)=offsetX(i,:)+orig(1);
	offsetY(i,:)=offsetY(i,:)+orig(2);
	
	if(mod(i,100)==0)
%		set(snake,'Xdata',[offsetX(i,:)],'Ydata',[offsetY(i,:)]);
		plot(offsetX(i,:),offsetY(i,:),'-X');
		drawnow
		pause(0.01)
	else
		continue
	end
end
hold off
saveas(gca,'swim.eps','psc2')
end
