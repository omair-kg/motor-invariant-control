animationfig = figure;
scale = 1;
leg1color = [1 0 0];
leg2color = [0 0 1];
%   'Position',[0 0.0273438 1 0.935547],...

set(animationfig,...
   'Name', 'Animation',...
   'Units','normalized',...
   'RendererMode','auto',...
   'Renderer','OpenGl',...
   'Color',[1 1 1],...
   'Visible','on');
AxesHandle=axes; axis off;
set(AxesHandle,...
   'Parent',animationfig,...
   'Position',[0 0 1 1],...
   'Ylim',scale*[-0.4 0.6],...
   'Xlim',scale*[-0.44 1]);
FloorHandle=line;
set(FloorHandle,...
   'Parent',AxesHandle,...
   'Color',[0 0 0],...
   'LineWidth',2,...
   'EraseMode','xor')
Leg1Handle=line;
set(Leg1Handle,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')
Leg2Handle=line;
   set(Leg2Handle,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot1Handle1=line;
   set(Foot1Handle1,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot1Handle2=line;
   set(Foot1Handle2,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot1Handle3=line;
   set(Foot1Handle3,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot1Handle4=line;
   set(Foot1Handle4,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot1Handle5=line;
   set(Foot1Handle5,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot1Handle6=line;
   set(Foot1Handle6,...
   'Parent',AxesHandle,...
   'Color',leg1color,...
   'LineWidth',2,...
   'EraseMode','xor')

Foot2Handle1=line;
   set(Foot2Handle1,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot2Handle2=line;
   set(Foot2Handle2,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot2Handle3=line;
   set(Foot2Handle3,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot2Handle4=line;
   set(Foot2Handle4,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot2Handle5=line;
   set(Foot2Handle5,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')
Foot2Handle6=line;
   set(Foot2Handle6,...
   'Parent',AxesHandle,...
   'Color',leg2color,...
   'LineWidth',2,...
   'EraseMode','xor')


r1    = parleg1(2);
l1    = parleg1(1);
r2    = parleg2(2);
l2    = parleg2(1);

gamma = -parworld(2);
Rgamma = [cos(gamma), -sin(gamma);
          sin(gamma),  cos(gamma)];
       
       
       
% floor
floorxy = scale*[-0.44  5; -0.002 -0.002];
          
floorxyr = Rgamma*floorxy;
set(FloorHandle,'Xdata',floorxyr(1,:),'Ydata',floorxyr(2,:));
   
alpha = 0.2; % foot segment size in [rad]
leg1xy = [-r1*sin(3*alpha),      -r1*sin(2*alpha),      -r1*sin(alpha),   0,       r1*sin(alpha),       r1*sin(2*alpha),       r1*sin(3*alpha), 0;
     r1-l1-r1*cos(3*alpha), r1-l1-r1*cos(2*alpha), r1-l1-r1*cos(alpha), -l1, r1-l1-r1*cos(alpha), r1-l1-r1*cos(2*alpha), r1-l1-r1*cos(3*alpha), 0];
   
leg2xy = [-r2*sin(3*alpha),      -r2*sin(2*alpha),      -r2*sin(alpha),   0,       r2*sin(alpha),       r2*sin(2*alpha),       r2*sin(3*alpha), 0;
     r2-l2-r2*cos(3*alpha), r2-l2-r2*cos(2*alpha), r2-l2-r2*cos(alpha), -l2, r2-l2-r2*cos(alpha), r2-l2-r2*cos(2*alpha), r2-l2-r2*cos(3*alpha), 0];
 

Tt=0:0.01:10
Yy=interp1(tout,yout,Tt); 
for i=1:size(Yy,1)
   
  
	t=Tt(i)

      q_t=Yy(i,[1:4])
       %model='stance phase leg 1'
	
      %walk_neuralEvent(t,yeout(i,:))
   	
      xh   = q_t(1);
      yh   = q_t(2);
 		phi1 = q_t(3);  
  		phi2 = q_t(4);
      Rphi1 = [cos(phi1), -sin(phi1);
               sin(phi1),  cos(phi1)];
      
      Rphi2 = [cos(phi2), -sin(phi2);
               sin(phi2),  cos(phi2)];
            
      x1 = Rgamma*([xh xh xh xh xh xh xh xh; yh yh yh yh yh yh yh yh] + Rphi1*leg1xy);
      x2 = Rgamma*([xh xh xh xh xh xh xh xh; yh yh yh yh yh yh yh yh] + Rphi2*leg2xy);

      set(Leg1Handle,'Xdata',x1(1,[4 8]),'Ydata',x1(2,[4 8]));
      set(Foot1Handle1,'Xdata',x1(1,[1 2]),'Ydata',x1(2,[1 2]));
      set(Foot1Handle2,'Xdata',x1(1,[2 3]),'Ydata',x1(2,[2 3]));
      set(Foot1Handle3,'Xdata',x1(1,[3 4]),'Ydata',x1(2,[3 4]));
      set(Foot1Handle4,'Xdata',x1(1,[4 5]),'Ydata',x1(2,[4 5]));
      set(Foot1Handle5,'Xdata',x1(1,[5 6]),'Ydata',x1(2,[5 6]));
      set(Foot1Handle6,'Xdata',x1(1,[6 7]),'Ydata',x1(2,[6 7]));
      set(Leg2Handle,'Xdata',x2(1,[4 8]),'Ydata',x2(2,[4 8]));
      set(Foot2Handle1,'Xdata',x2(1,[1 2]),'Ydata',x2(2,[1 2]));
      set(Foot2Handle2,'Xdata',x2(1,[2 3]),'Ydata',x2(2,[2 3]));
      set(Foot2Handle3,'Xdata',x2(1,[3 4]),'Ydata',x2(2,[3 4]));
      set(Foot2Handle4,'Xdata',x2(1,[4 5]),'Ydata',x2(2,[4 5]));
      set(Foot2Handle5,'Xdata',x2(1,[5 6]),'Ydata',x2(2,[5 6]));
      set(Foot2Handle6,'Xdata',x2(1,[6 7]),'Ydata',x2(2,[6 7]));
 
 
 drawnow
 pause(0.01)

end
pause

close(animationfig);