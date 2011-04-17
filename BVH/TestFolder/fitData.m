ch2Test(:,1:6)=ch2(:,1:6);
ch2Test(:,7:30)=ch2(:,7:30);
ch2Test(:,32)=ch2(:,32);
l=ch2Test(:,46:57)
r=ch2Test(:,58:69)
ch2Test(:,46:57)=-r;
ch2Test(:,58:69)=-l;
