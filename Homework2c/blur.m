function newImage = blur(origImage)
% blur
%
% Creates and returns a new image that is the image that results from 
% applying the blur filter to the original image. The blur filter  
% creates a blurred image by averaging pixel values.
% 
% Input:
%   origImage    the original image
%
% Output: the image that results from applying the blur filter to the 
%         original image
%

% convert original image from jpg matrix format to "regular" matrix format
origPixels = jpg2matrix(origImage);

% create a new image matrix (in "regular" format) the same size as the 
% original matrix    
[row, col] = size(origPixels);
newPixels = zeros(row, col);

% creates two arrays that stores the row and column indices for the 5x5
% sub-matrix 
rVal = [-2*ones(1,5) -1*ones(1,5) zeros(1,5) ones(1,5) 2*ones(1,5)];
cVal = [-2:2 -2:2 -2:2 -2:2 -2:2];

for r = 1:row            % for each row r in the image matrix    
    for c = 1:col        %     for each row c in row r in the image matrix
        rSum = rVal + r; %         stores row indices for origPixels
        cSum = cVal + c; %         stores column indices for origPixels
        
        % checks that row-column index pairs are within the original matrix
        % and stores the pairs in a 2-row matrix
        isValid = rSum > 0 & cSum > 0 & rSum <= row & cSum <= col;
        rcVals = [rSum(isValid); cSum(isValid)];
        
        % finds the min and max values for the row and column indices
        rMaxVal = max(rcVals(1,:));
        rMinVal = min(rcVals(1,:));
        cMaxVal = max(rcVals(2,:));
        cMinVal = min(rcVals(2,:));
        
        % calculates the sum of all elemnts with valid indices
        sums = sum(sum(origPixels(rMinVal:rMaxVal, cMinVal:cMaxVal)));
        
        % finds the average and stores the value in a new matrix
        newPixels(r, c) = round(sums/length(rcVals));
    end
end    

% convert new image from "regular" matrix format to jpg matrix format
newImage = matrix2jpg(newPixels);
    