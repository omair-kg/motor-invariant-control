drawdata=[];
for i=1:8
	drawdata=[drawdata,data{i}(:,1)]
end
plotSnake(drawdata)

