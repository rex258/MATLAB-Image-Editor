function newImage = sharpen(origImage)
% sharpen
%
% Creates and returns a new image that is the image that results  
% from applying the sharpen filter to the original image. The sharpen  
% filter creates a "sharper" image by making dark pixels darker and 
% light pixels lighter.
% 
% Input:
%   origImage    the original image
%
% Output: the image that results from applying the sharpen filter to  
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
        if origPixels(r, c) < 128
            newPixels(r, c) = origPixels(r, c) - 12;
        else
            newPixels(r, c) = origPixels(r, c) + 12;
        end
    end
end    

% convert new image from "regular" matrix format to jpg matrix format
newImage = matrix2jpg(newPixels);    
    