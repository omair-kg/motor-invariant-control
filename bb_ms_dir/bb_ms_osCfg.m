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


heightAction=1
speedAction=sqrt(heightAction)
outAction=sqrt(heightAction)
inputAction=sqrt(heightAction)

GRAVITY=9.81
%{
orig
K=2
D=0.1

B=2.0
R=2.0
C=1.0
TA1=0.25
TA2=0.5
H=0.1
HO=0.1
RATIO=10
%}
%{
%not coupled
K=2
D=0.1

B=2.0
R=2.0
C=1.0
TA1=0.25
TA2=0.5
H=0
HO=0
%}

%%{
K=0
D=0

B=2.0
R=2.0
C=1.0
TA1=0.25
TA2=0.5
TA1=TA1*speedAction
TA2=TA2*speedAction
H=0.1
H=H/inputAction
HO=0.1
HO=HO*outAction
%%}


%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
INI_CON=[5*heightAction 0, 0.0 0.0, 1.0 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
%INI_CON=[10 0, 1.0 1.0, 0.1 0 0 0]
TIME_SPAN=[0,50]


