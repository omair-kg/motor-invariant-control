function [value,isterminal,direction] = pwnHeelStrikeEvent(t,y)
global originalX;
global originalY;
global tempX;
global tempY;
global l;



c1=cos(y(1));
s1=sin(y(1));

c2=cos(y(2));
s2=sin(y(2));
heelpos=[c1 -s1;s1,c1]*[0;l]+[c2,-s2;s2,c2]*[0;-l]+[originalX;originalY];
tempX=heelpos(1);
tempY=heelpos(2);



value=tempY-TerrainSlope(tempX);
isterminal=1;
direction=-1;
end
