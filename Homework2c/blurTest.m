function newImage = blur2(origImage)
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
  
for r = 1:row            % for each row r in the image matrix    
    for c = 1:col        %     for each row c in row r in the image matrix
        sum = 0;
        count = 0;
        for rr = -2:2           % for each row rr in 5x5 matrix
            tempR = r + rr;
            for cc = -2:2       %     for each column cc in 5x5 matirx
                tempC = c + cc;
                % checks whether the 5x5 matrix is within the orig matrix
                if tempR > 0 && tempC > 0 && tempR <= row && tempC <= col
                    sum = sum + origPixels(tempR, tempC);
                    count = count + 1;
                end
            end
        end
        newPixels(r, c) = round(sum/count);
    end
end  