msnodraw
figure 
plot(T,Y(:,1))
hold on
load par_orig_data
plot(T,Y(:,1),'r')
load par_note_coupled
plot(T,Y(:,1),'g')
