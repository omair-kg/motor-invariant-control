function z=map2index(x)
global low
global high
global dim
global du
index=floor((x-low)./du)
z=index(1)+index(2)*dim(1)+index(3)*dim(1)*dim(2)