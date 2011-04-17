function [y,dy,xlk,ylk,xrk,yrk]=stanceshader(Y)

% S GUO
global L;
global leg;
global yL;
global yR;


L1=leg/2;
L2=leg/2;
R1=leg/2;
R2=leg/2;

for frame=1:1:size(Y)
    %y=sqrt(2*Ed)/a*sin(a/b*t);
    %dy=gradient(y);
    y=Y(frame);
   
    CL=sqrt((y-yL)^2+L^2);
    CR=sqrt((y-yR)^2+L^2);
    cos_theta_l=(L1^2+L2^2-CL^2)/(2*L1*L2);
    cos_theta_r=(R1^2+R2^2-CR^2)/(2*R1*R2);
    theta_l=acos(cos_theta_l);
    theta_r=acos(cos_theta_r);
    

    %{
    theta_l_a=2.0*atan((11.0*tan(0.5*theta_l)^2 + (21.0*tan(0.5*theta_l)^4 - 79.0*tan(0.5*theta_l)^2 - 100.0)^(1/2))/(10.0*tan(0.5*theta_l)^2 + 11.0*tan(0.5*theta_l) + 10.0));
    %2.0*atan((11.0*tan(0.5*theta_l)^2 - 1.0*(21.0*tan(0.5*theta_l)^4 - 79.0*tan(0.5*theta_l)^2 - 100.0)^(1/2))/(10.0*tan(0.5*theta_l)^2 + 11.0*tan(0.5*theta_l) + 10.0))
    theta_r_a=2.0*atan((11.0*tan(0.5*theta_r)^2 + (21.0*tan(0.5*theta_r)^4 - 79.0*tan(0.5*theta_r)^2 - 100.0)^(1/2))/(10.0*tan(0.5*theta_r)^2 + 11.0*tan(0.5*theta_r) + 10.0));
    %2.0*atan((11.0*tan(0.5*theta_r)^2 - 1.0*(21.0*tan(0.5*theta_r)^4 - 79.0*tan(0.5*theta_r)^2 - 100.0)^(1/2))/(10.0*tan(0.5*theta_r)^2 + 11.0*tan(0.5*theta_r) + 10.0))
 
    
    %theta_la=double(theta_l_a);
    %theta_ra=double(theta_r_a);
    
    for i=1:1:size(theta_l_a)
        if((theta_la>0.5*pi)&&(theta_la<pi))
            la=theta_la(i);
        end
    end
    
    
    for i=1:1:size(theta_r_a)
        if((theta_ra>0.5*pi)&&(theta_ra<pi))
            ra=theta_ra(i);
        end
    end
    %}
%    la=2.0*atan((11.0*tan(0.5*theta_l)^2 - 1.0*(21.0*tan(0.5*theta_l)^4 - 79.0*tan(0.5*theta_l)^2 - 100.0)^(1/2))/(10.0*tan(0.5*theta_l)^2 + 11.0*tan(0.5*theta_l) + 10.0));
%    ra=2.0*atan((11.0*tan(0.5*theta_r)^2 + (21.0*tan(0.5*theta_r)^4 - 79.0*tan(0.5*theta_r)^2 - 100.0)^(1/2))/(10.0*tan(0.5*theta_r)^2 + 11.0*tan(0.5*theta_r) + 10.0));
   

    % theta_r_a=solve('L1*sin(theta_r_a)+L2*sin(theta_r-theta_r_a)=L','theta_r_a');
    la=2*atan((L1 - L2 + L1*tan(theta_l/2)^2 + L2*tan(theta_l/2)^2 - (- L^2*tan(1/2*theta_l)^4 - 2*L^2*tan(1/2*theta_l)^2 - L^2 + L1^2*tan(1/2*theta_l)^4 + 2*L1^2*tan(1/2*theta_l)^2 + L1^2 + 2*L1*L2*tan(1/2*theta_l)^4 - 2*L1*L2 + L2^2*tan(1/2*theta_l)^4 + 2*L2^2*tan(1/2*theta_l)^2 + L2^2)^(1/2))/(L*tan(theta_l/2)^2 + 2*L2*tan(theta_l/2) + L));
    ra=2*atan((L1 - L2 + L1*tan(theta_r/2)^2 + L2*tan(theta_r/2)^2 + (L1^2*tan(theta_r/2)^4 - 2*L^2*tan(theta_r/2)^2 - L^2 - L^2*tan(theta_r/2)^4 + 2*L1^2*tan(theta_r/2)^2 + L1^2 + 2*L1*L2*tan(theta_r/2)^4 - 2*L1*L2 + L2^2*tan(theta_r/2)^4 + 2*L2^2*tan(theta_r/2)^2 + L2^2)^(1/2))/(L*tan(theta_r/2)^2 + 2*L2*tan(theta_r/2) + L));
    
    
    xlk=L1*cos(la)+yL;
    ylk=L1*sin(la);
    
    xrk=R1*cos(ra)+yR;
    yrk=R1*sin(ra);
    
    clf;
    axis([-2 2 0 2]);
    line([yL xlk y],[0 ylk 1], 'Color', [1 0 0]);
    line([yR xrk y],[0 yrk 1], 'Color', [0 1 0]);
    pause(0.01);
    
end
    