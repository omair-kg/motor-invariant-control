function walk_transManyplot(test_data)
'time'
T=test_data{1};

'value'
Y=test_data{2};
teout=test_data{3};
yeout=test_data{4};
%'map'
%map=test_data{7};



subplot(3,2,1:2)

plot(T,Y(:,3)-Y(:,4))
hold 
plot(teout,yeout(:,3)-yeout(:,4),'*')
hold off
grid on

subplot(3,2,3:4)
plot(T,Y(:,[3 4]))



%phaseplane
subplot(3,2,5:6)
plot(Y(:,3),Y(:,4))

%phaseplane




%subplot(4,2,7)
%contour(map)
%subplot(4,2,8)
%entrain_data=[px Y(:,1)]
%plot(T,entrain_data);
