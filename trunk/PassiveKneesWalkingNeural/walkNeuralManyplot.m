function walkNeuralManyplot(test_data)
'time'
T=test_data{1};

'value'
Y=test_data{2};
%'map'
%map=test_data{7};
mX1=Y(:,9);
mX2=Y(:,10);
mX1=max([mX1 zeros(size(mX1))]')';
mX2=max([mX2 zeros(size(mX2))]')';
px=mX1-mX2;
py=Y(:,11)-Y(:,12);


subplot(3,2,1:2)
plot(T,Y(:,3)-Y(:,4))

subplot(3,2,3:4)
plot(T,[px Y(:,3)-Y(:,4)])

%phaseplane
subplot(3,2,5)
plot(Y(:,3),Y(:,4))

%phaseplane
subplot(3,2,6)
plot(px,py)


%subplot(4,2,7)
%contour(map)
%subplot(4,2,8)
%entrain_data=[px Y(:,1)]
%plot(T,entrain_data);
