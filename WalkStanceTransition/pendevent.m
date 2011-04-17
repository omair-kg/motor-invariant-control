function [lookfor stop direction]=pendevent(t,y)
global d
lookfor=[y(1)-d;y(1)+d];
stop=[1;1];
direction=[(1 -1);(1 -1)];
