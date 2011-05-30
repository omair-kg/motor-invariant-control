function qout=HipLegDraw(hip,tip,L)

% S GUO
dis=hip-tip
angle=acos(dis./L)
x=sin(angle)*L*0.5
mid=(hip+tip)*0.5
ox=0;
for i=1:length(hip)
	ox=ox+0.01;
	clf
	axis equal
	axis([-2 20 0 2]);	
	line([0 x(i), 0]+ox,[hip(i),mid(i),tip(i)], 'LineWidth',2,'Color', [1 0 0]);
	rectangle('Position',[-0.1+ox,hip(i)-0.1,0.2,0.2])
	pause(0.01)
    

end
    
