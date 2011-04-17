%  Walking Simulation Example - WRite matrix in m-file
%
%  This function writes matrix A in the M-file indicated with fid. 
%
%   Copyright (c) 2002 by Martijn Wisse,
%   Delft Bio-robotics Laboratory, Delft University of Technology.


function wse_wr(fid, A)

fprintf(fid, '%s = [',inputname(2));
A = sym(A);
for i = 1:size(A,1)
   if (i>1), fprintf(fid, ';\n     '); end
   for j = 1:size(A,2)
      if (j>1), fprintf(fid, ', '); end
      fprintf(fid, '%s',char(A(i,j)));
   end
end
fprintf(fid, '];\n');
