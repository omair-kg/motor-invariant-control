function [slope_action,speed_action]=GetNextStepFunction(ori,wk_idx,ipos,dq1,dq2)
global l;
global STables;
global IPos;
global ISpeed;
global ITables;


qf=ITables(wk_idx,:);
qf1=qf(1)
qf2=qf(2)

gamma2=qf1+qf2;
gamma=0.5*gamma2;

angle=0.5*(ipos);
stepsize=2*sin(angle)*l

offset=interp1(IPos,STables,ipos);
if(ipos)>max(IPos)
	offset=STables(end);
end
if(ipos)<min(IPos)
	offset=STables(1);
end

%gamma=gamma+offset

ox=ori(1);
oy=ori(2);
[y1,s1,sp1]=TerrainSlope(ox+stepsize)
[y2,s2,sp2]=TerrainSlope(ox+stepsize*cos(s1))
slope_action=s2-gamma
ITables
qf=interp1(STables,ITables,offset)

dqf1=qf(4);
dqf2=qf(5);

sp1=dq1/dqf1
speed_action=1
end

