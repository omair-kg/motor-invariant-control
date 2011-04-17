function [Vy,slope_ac,speed_ac]=TerrainSlope(hX)
global xpos
global ypos

xpos=[0.0,1.0,3.0,4.0];
ypos=[0.0,0.05,0.05,0.0];
xspeed=[0.0,1.0,3.0,4.0];
speed=[1.0,1.0,1.0,1.0];

xp=0:0.01:4;
yp=interp1(xpos,ypos,xp);
sp=interp1(xspeed,speed,xp);

dx=xp(2:end)-xp(1:end-1);
dy=yp(2:end)-yp(1:end-1);


slopes=atan2(dy,dx);
Vy=interp1(xp,yp,hX);
slope_ac=interp1(xp(1:end-1),slopes,hX);
speed_ac=interp1(xp,sp,hX);
end
