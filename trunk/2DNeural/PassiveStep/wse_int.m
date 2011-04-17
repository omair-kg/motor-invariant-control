% Walking Simulation Example - INTerpolate instant of heelstrike
%     for Matlab 5.2 and up
%
%
% This file finds the exact instant that heelstrike occurs, given that it has occurred sometime
% between the last and the previous integration sample.
% 
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology


function wse_int
global g_t q_t qd_t t_t f_t parsim current mode
dt = parsim(1);

switch mode
case 'stance phase leg 1'
   gd1 = wse_mat('D2',q_t(current-1,:),qd_t(current-1,:))*qd_t(current-1,:).';
   gd2 = wse_mat('D2',q_t(current,:),qd_t(current,:))*qd_t(current,:).';
   gyd1 = gd1(2);
   gyd2 = gd2(2);
   gy1 = g_t(current-1,4);
   gy2 = g_t(current,4);
case 'stance phase leg 2'
   gd1 = wse_mat('D1',q_t(current-1,:),qd_t(current-1,:))*qd_t(current-1,:).';
   gd2 = wse_mat('D1',q_t(current,:),qd_t(current,:))*qd_t(current,:).';
   gyd1 = gd1(2);
   gyd2 = gd2(2);
   gy1 = g_t(current-1,2);
   gy2 = g_t(current,2);
end

ddt = wse_zerocross([gy1 gy2], [gyd1 gyd2], dt);

% now use third order polynome to interpolate q and qd
ksi = ddt/dt;
intv= [1-3*ksi^2+2*ksi^3, (ksi-2*ksi^2+ksi^3)*dt, 3*ksi^2-2*ksi^3, (-ksi^2+ksi^3)*dt];
qint=intv*[q_t(current-1,:); qd_t(current-1,:); q_t(current,:); qd_t(current,:)];
intvd=[(-6*ksi+6*ksi^2)/dt, 1-4*ksi+3*ksi^2, (6*ksi-6*ksi^2)/dt, -2*ksi+3*ksi^2];
qdint=intvd*[q_t(current-1,:); qd_t(current-1,:); q_t(current,:); qd_t(current,:)];
% linear interpolation for f (we have no derivatives)
fint = f_t(current-1,:)+ksi*(f_t(current,:)-f_t(current-1,:));



%   don't trust interpolated values for xhd and yhd ...
[qint, qdint] = wse_dep(qint, qdint);


% store new interpolated values instead of results of last wse_rk4.m-call
t_t(current)   = t_t(current-1) + ddt;
q_t(current,:) = qint;
qd_t(current,:)= qdint;
f_t(current, :)  = fint;
g_t(current, :) = [wse_mat('g1',q_t(current,:),qd_t(current,:)); wse_mat('g2',q_t(current,:),qd_t(current,:))].';    
    
function x = wse_zerocross(f,fd,dx)

if (f(1)*f(2))>0
	error('Zero or more than one boundary crossings')
end

   y  = [f(1);  f(2)];
   yd = [fd(1); fd(2)];

   DCBA=[0 0 0 1; dx^3 dx^2 dx 1; 0 0 1 0; 3*dx^2 2*dx 1 0]\[y;yd];
   sol=roots(DCBA);
   corr_sol=[(sol>0)&(sol<dx)]';
   x=corr_sol*sol;
      
