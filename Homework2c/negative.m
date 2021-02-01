function newImage = negative(origImage)
% negative
%
% Creates and returns a new image that is the image that results from 
% applying the negative filter to the original image. The negative  
% filter creates a "negative" image where shades are flipped: black  
% becomes white, white becomes black, etc.
% 
% Input:
%   origImage    the original image
%
% Output: the image that results from applying the negative filter to  
%         the original image
%

% convert original image from jpg matrix format to "regular" matrix format
origPixels = jpg2matrix(origImage);

% create a new image matrix (in "regular" format) the same size as the 
% original matrix    
[row, col] = size(origPixels);
newPixels = zeros(row, col);

for r = 1:row            % for each row r in the image matrix    
    for c = 1:col        %     for each row c in row r in the image matrix
    
       % to convert black (0) to white (255), white to black, and flip 
       % all the shades of gray in-between, subtract the original pixel 
       % value from 255
       newPixels(r, c) =  255 - origPixels(r, c);    
       
    end
end

% convert new image from "regular" matrix format to jpg matrix format
newImage = matrix2jpg(newPixels);

