stanceCfg

options=odeset('Events',@pendevent);
[T,Y]=ode45(@stanceNeuralSim,TIME_SPAN,INI_CON,options);
plot(Y(:,1),Y(:,2));
axis equal
%grid on
%plot(T,Y(:,3)-Y(:,4))
%{
yi1=linspace(-0.18,-0.04,10);
yi2=linspace(0.04,0.18,10);
yi=cat(2,yi1,yi2);

dyi=linspace(-1,1,20);


for i=1:1:size(yi,2)
    for j=1:1:size(dyi,2)
        
    [T,Y]=ode45(@stanceSim,[0,40],[yi(i),dyi(j)],options);
    
    hold on
    axis equal
    plot(Y(:,1),Y(:,2));
    
    end
end
%}
%stanceshader(Y(:,1));

