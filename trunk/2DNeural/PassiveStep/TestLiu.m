clear all
global parsim parworld parhip parleg1 parleg2 footholds q_t qd_t xf_t g_t t_t f_t current mode impacts
% set parameters and initial conditions
wse_par;
wse_ini;

mode = 'stance phase leg 1';

% independent initial conditions
phi1  = -0.2032;  % counter-clockwise rotation of leg 1 
phi1d =-1.5151; % velocity of counter-clockwise rotation of leg 1 
phi2d =-1.4205; % velocity of counter-clockwise rotation of leg 2

phi2  =-phi1;    % counter-clockwise rotation of leg 2

% dependent initial conditions (the correct values 
xh    = 0;       % x-coordinate of hip joint
yh    = 0;       % y-coordinate of hip joint
xhd   = 0;      % velocity of x-coordinate of hip joint
yhd   = 0;      % velocity of y-coordinate of hip joint

xf1   = 0;      % location of foothold of leg 1 (equals x-coordinate of contact point if phi1=0)
xf2   = 0;      % location of foothold of leg 2 (equals x-coordinate of contact point if phi2=0)

q  = [xh,  yh,  phi1,  phi2];
qd = [xhd, yhd, phi1d, phi2d];

footholds = [xf1, xf2];


totallength = parsim(3);
% prepare state storage matrices
q_t  = zeros(totallength, 4);
qd_t = zeros(totallength, 4);
t_t  = zeros(totallength, 1);
g_t  = zeros(totallength, 4);
f_t  = zeros(totallength, 4);
xf_t = zeros(totallength, 2);
impacts = [];

q1=q
qd1=qd
current = 1;
startmode=mode
[q_t(1,:),qd_t(1,:)]=wse_dep(q1,qd1);
q_t(1,:)
qd_t(1,:)



    
 event='none';
 current=1;

    while(event=='none')
        wse_rk4;
        wse_evd;
       
    end
   q_t(current,3:4)  = [ q_t(current,4)  q_t(current,3)];
   qd_t(current,3:4) = [qd_t(current,4) qd_t(current,3)];
   qn=q_t(current,:)
   qdn=qd_t(current,:)

mode=startmode;


