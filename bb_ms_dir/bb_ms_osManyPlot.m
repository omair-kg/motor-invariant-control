function bb_ms_osManyplot(test_data)
'time'
global H
global HO
T=test_data{1};

'value'
Y=test_data{2};
'map'

mX1=Y(:,5);
mX2=Y(:,6);
mX1=max([mX1 zeros(size(mX1))]')';
mX2=max([mX2 zeros(size(mX2))]')';
px=mX1-mX2;
py=Y(:,7)-Y(:,8);


subplot(4,2,1:2)
entrain_data=[px H*Y(:,2)];
plot(T,entrain_data);

subplot(4,2,3:4)
entrain_data=[px*HO Y(:,1)];
plot(T,entrain_data);


%phaseplane
subplot(4,2,5)
plot(Y(:,3),Y(:,4))

%phaseplane
subplot(4,2,6)
plot(px,py)

%phaseplane
subplot(4,2,7)
plot(Y(:,1),Y(:,2))


subplot(4,2,8)
plot(T,Y(:,2))



