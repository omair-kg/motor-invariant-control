    q1;
    qd1;
    [qt(1,:),qdt(1,:)]=wse_dep(q1,qd1);
    event='none'
    current=1
    while(event=='none')
        wse_rk4;
        wse_evd;
    end
   q_t(current,3:4)  = [ q_t(current,4)  q_t(current,3)];
   qd_t(current,3:4) = [qd_t(current,4) qd_t(current,3)];
   qn=q_t(current,:);
   qdn=qd_t(current,:);

