function dx=walk_trans(t,x)
	global mode

	q=x(1:4);	
	qd=x(5:8);

	dx=zeros(8,1);
	%nx=x(9:12);
	
	

	%dx(9:12)=os(t,nx);
	dx(1:4)=qd;
	dx(5:8)=ub_eom(q,qd,mode);
end


function [qdd, fc] = ub_eom(q, qd, mode)
global parworld parhip parleg1 parleg2 footholds
% world parameters
g     = parworld(1);  % gravity
gamma = parworld(2);  % slope angle

% leg parameters
m1    = parleg1(5);   % leg 1: mass
I1    = parleg1(6);   % leg 1: moment of inertia
m2    = parleg2(5);   % leg 2: mass
I2    = parleg2(6);   % leg 2: moment of inertia

% states
phi1   = q(3);
phi2   = q(4);
phi1d  = qd(3);
phi2d  = qd(4);

% calculation of required matrices
T = wse_mat('T',q,qd);
TT = wse_mat('TT',q,qd);

% mass matrix 

M = diag([m1, m1, I1, m2, m2, I2]);

% construction of reduced mass matrix  
A = T.'*M;  % A is a temporary matrix, employed for calculation speed
Mr = A*T;

%gravity forces
fg = M * [ g*sin(gamma);
          -g*cos(gamma);
           0;
           g*sin(gamma);
          -g*cos(gamma);
           0];

% reduced force vector
%fr = T.'*fg  - A*TT;
%+[0;0;SOUT;-SOUT];

switch mode
	case {'stance phase leg 1'}
	u=walk_transControl(q(3),q(4));
	case {'stance phase leg 2'}
    	u=walk_transControl(q(4),q(3));
	u=[u(2),u(1)]';
	otherwise
	u=[0,0]'
end

fr = T.'*fg  - A*TT-[0,0,u(1),u(2)]';
switch mode
case 'stance phase leg 1'
   
   % complete mass matrix including constraint equations
   D1 = wse_mat('D1',q,qd);
   S = [Mr   D1.'						
   	  D1 zeros(size(D1,1))];
   % complete right hand side of equations of motion, including corriolis terms     
   DD1 = wse_mat('DD1',q,qd);
   rhs = [fr; 
          -DD1];

   % solve equations of motion
   solution = S\rhs;
   
   % sort: solution contains both contact forces and leg accelerations
   qdd = solution(1:4).';
   fc  = [solution(5:6); 0; 0].';

case 'stance phase leg 2'
   
   % complete mass matrix including constraint equations
   D2 = wse_mat('D2',q,qd);
   S = [Mr   D2.'						
   	  D2 zeros(size(D2,1))];
   % complete right hand side of equations of motion, including corriolis terms     
   DD2 = wse_mat('DD2',q,qd);
   rhs = [fr; 
          -DD2];

   % solve equations of motion
   solution = S\rhs;
   
   % sort: solution contains both contact forces and leg accelerations
   qdd = solution(1:4).';
   fc  = [0; 0; solution(5:6)].';

case 'heel strike leg 1'
   % this part calculates a collision between the floor and leg 1 which is about 
   % to become the new stance leg
   
   % complete mass matrix including constraint equations
   D1 = wse_mat('D1',q,qd);
   S = [Mr   D1.'						
   	  D1 zeros(size(D1,1))];
        
   % complete right hand side of impact equations     
   e = 0;
   rhs =  [Mr; -e*D1]*qd.';

   % solve equations of motion
   solution = S\rhs;
   
   % sort: solution contains both contact impulses and leg velocities
   qdd = solution(1:4).';  %note that qdd is not a correct name now; it contains velocities
   fc  = [solution(5:6); 0; 0].';  % idem; fc contains impulses, not forces
   
case 'heel strike leg 2'
   % this part calculates a collision between the floor and leg 2 which is about 
   % to become the new stance leg
   
   % complete mass matrix including constraint equations
   D2 = wse_mat('D2',q,qd);
   S = [Mr   D2.'						
   	  D2 zeros(size(D2,1))];
        
   % complete right hand side of impact equations     
   e = 0;
   rhs =  [Mr; -e*D2]*qd.';

   % solve equations of motion
   solution = S\rhs;
   
   % sort: solution contains both contact impulses and leg velocities
   qdd = solution(1:4).';  %note that qdd is not a correct name now; it contains velocities
   fc  = [0; 0; solution(5:6)].';  % idem; fc contains impulses, not forces
   
end
end


%{
function dxn=os(t,xn)
	global B C R TA1 TA2 H HO
	global SINPUT SOUT
	

	i=SINPUT;
	pi=max([i,0]);
	ni=max([-i,0]);
	
	dxn=zeros(4,1);
	x1=xn(1);
	x2=xn(2);
	v1=xn(3);
	v2=xn(4);


	mx1=max([0,x1]);
	mx2=max([0,x2]);

	dxn(1)=C-x1-B*v1-R*mx2-H*pi;
	dxn(1)=dxn(1)/TA1;
	dxn(2)=C-x2-B*v2-R*mx1-H*ni;
	dxn(2)=dxn(2)/TA1;

	dxn(3)=(mx1-v1)/TA2;
	dxn(4)=(mx2-v2)/TA2;	
	
	SOUT=HO*(mx1-mx2);
	
end
%}

