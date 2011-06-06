clear all
load data/backup/h3a1c;
ti=tout(1):0.01:tout(end);
yi=interp1(tout,yout,ti);
pi=interp1(tout,pedalpos,ti)
pi=pi(:)
L=1
endPos=yi(:,1)-pi;
leg=L-pi+min(pi)

hip=leg+endPos;

%HipLegDraw(hip,endPos,L)

[sk,ch,fl]=bvhReadFile('BVHTemplate.bvh');
framech=[0,hip,0,0,0,0]
%bvhWriteFile([bvhFilePath,'.bvh'],sk,framech,fl);



