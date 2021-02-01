function matrix = jpg2matrix( jpgMatrix )
% jpg2matrix
% 
% Given a pixel matrix that is in jpg representation, creates and 
% returns a "regular" MATLAB matrix (on which filter operations may 
% be applied).
%
% Input:
%   jpgMatrix  the pixel matrix in the form MATLAB uses to represent 
%              jpg images (e.g., the form returned by imread)
%
% Output: the same matrix in "regular" MATLAB form
% 
[row, col] = size(jpgMatrix);
matrix = zeros(row, col);
for r = 1 : row
    for c = 1 : col
        matrix(r, c) = jpgMatrix(r, c);
    end
end
