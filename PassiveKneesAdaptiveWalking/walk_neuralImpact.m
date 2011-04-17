l=length(T);
q=Y(l,[1:4]);
q_d=Y(l,[5:8]);
g_t= [wse_mat('g1', q,q_d); wse_mat('g2', q,q_d)]';

switch mode
case 'stance phase leg 1'
	mode='heel strike leg 2'
case 'stance phase leg 2'
	mode='heel strike leg 1'
end

switch mode
case 'heel strike leg 1'
   footholds(1) = footholds(1) + g_t(1);
case 'heel strike leg 2'
   footholds(2) = footholds(2) + g_t(3);
end

[qd_new,impact] = wse_eom(q, q_d, mode);   

switch mode
case 'heel strike leg 1'
	mode= 'stance phase leg 1';
case 'heel strike leg 2'
	mode= 'stance phase leg 2';
end

q_new=q;



