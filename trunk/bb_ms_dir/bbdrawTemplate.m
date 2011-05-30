clear all
global GRAVITY
global K D
global B C R TA1 TA2 H HO 
global SINPUT SOUT
global INI_CON
global RATIO
global TIME_SPAN


global heightAction
global speedAction
global outAction

TIME_SPAN=[0,50]
INI_CON=[ 1.2037   0         0         0    0.4283   -0.0219    0.1443    0.2375]


GRAVITY=9.81

K=0
D=0

B=2.0
R=2.0
C=1.0
TA1=0.25*20
TA2=0.5*20

H=0.1
%---------------------------------------------
HO=0.1

for heightAction=[0.1]
	for dh=[0.3]
			GRAVITY=9.81

			K=0
		D=0

	B=2.0
	R=2.0
	C=1.0
	TA1=0.25%*0.4*0.7
	TA2=0.5%*0.4*0.7

	H=0.1
	HO=0.2
			INI_CON(1)=dh

			bbdataGenerate
			save(['data/h' num2str(dh*10) 'a' num2str(heightAction*10),'c'],'tout','yout','pedalpos')

	end		
end


%---------------------------------------------

%{
HO=0.0
heightAction=1
for dh=5:5:20
		INI_CON(1)=dh
		bbdataGenerate
		save(['data/h' num2str(dh) 'uncoupled'],'tout','yout')
end
%}		


%{
HO=0.1

for heightAction=[3]
for dh=[20]
		INI_CON(1)=dh*heightAction
		bbdataGenerate
		save(['data/h' num2str(dh) 'a' num2str(heightAction),'c'],'tout','yout')
end
end		


%}
