function [slope_action,speed_action]=GetNextStepFunction(ori,wk_idx,ipos,dq1,dq2)
global l;
global STables;
global IPos;
global ISpeed;
global ITables;
global SslopeAction;
global HO;
global sc;

if(isempty(sc))
sc=0
end
sc=max([sc-1,0]);




qf=ITables(wk_idx,:);
gamma=0.5*(qf(1)+qf(2))

dqf=qf(4)
dq1

angle=0.5*(ipos);
stepsize=2*sin(angle)*l

%{
offset=interp1(IPos,STables,ipos);
if(ipos)>max(IPos)
	offset=STables(end);
end
if(ipos)<min(IPos)
	offset=STables(1);
end
%}
%gamma=gamma+offset

ox=ori(1);
oy=ori(2);


[y0,s0,sp0]=TerrainSlope(ox);
ox+stepsize*(cos(s0))
[y1,s1,sp1]=TerrainSlope(ox+stepsize*cos(s0));

sp0
sp1
s0
s1
sc
s0-s1

	if((s1-s0)>0.01)
		gamma=-0.0803
	elseif ((s0-s1)>0.01)		
		gamma=-0.0503	
	else
		gamma=-0.0503
		
	end


HO=sp1


s1=max(s1,s0)

slope_action=s1-gamma;
%{
ITables
qf=interp1(STables,ITables,offset)

dqf1=qf(4);
dqf2=qf(5);

sp1=dq1/dqf1
%}
speed_action=1;
end

