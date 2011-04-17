function [q1 q2,q3,dq1,dq2,dq3]=s2wTransform(halfsize,l,dx)
	s=halfsize/l
	q1=asin(s)
	q2=-q1
	q3=-q1
	v=dx*l/sqrt(1-s*s)

	
	dq1=v/l	
	dq2=v*cos(2*q1)/l
	dq3=v*cos(2*q1)/l		
end
