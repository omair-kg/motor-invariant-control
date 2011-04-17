function [Vy,slope_ac,speed_ac]=TerrainSlope(hX)
global xpos
global ypos
global maxLeng

xpos=[	0.0,	 	9.72 	maxLeng];
ypos=[ 	0.0,		1.0 	1.0];
xspeed=[0.0,		9.52,9.73,	maxLeng];
speed=[0.0, 		0.6, 0.2,	0.0];

xp=min(xpos):0.01:max(xpos);
yp=interp1(xpos,ypos,xp);
sp=interp1(xspeed,speed,xp);

dx=xp(2:end)-xp(1:end-1);
dy=yp(2:end)-yp(1:end-1);





slopes=atan2(dy,dx);
Vy=interp1(xp,yp,hX);
slope_ac=interp1([xp(1:end)],[0 slopes],hX);
speed_ac=interp1(xp,sp,hX);
end
