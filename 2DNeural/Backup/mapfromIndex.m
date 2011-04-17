function value=mapfromIndex(z)
global low
global high
global dim
global du
index=zeros(size(dim));
index(3)=floor(z/(dim(2)*dim(1)));
z=z-index(3)*dim(2)*dim(1);
index(2)=floor(z/dim(1));
z=z-index(2)*dim(1);
index(1)=floor(z);
index
value=low+index.*du+0.5*du;