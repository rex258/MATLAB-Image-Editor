function jpgMatrix = matrix2jpg( matrix )
% matrix2jpg
% 
% Given a matrix that is in "regular" MATLAB representation, creates  
% and returns a pixel matrix in jpg representation. In the jpg 
% representation, pixel values are integer values between 0 and 255, 
% inclusive. Values in the input matrix that are not integers are  
% rounded to the nearest integer values; values less than 0 are  
% converted to 0; values greater than 255 are converted to 255.
%
% Input:
%   matrix   the pixel matrix in "regular" MATLAB form
%
% Output: the corresponding matrix in the form MATLAB uses to represent 
%         jpg images (which can then be display using imshow)
% 
[row, col] = size(matrix);
jpgMatrix = zeros(row, col, 'uint8');
for r = 1 : row
    for c = 1 : col
        jpgMatrix(r, c) = round(matrix(r, c));
    end
end


