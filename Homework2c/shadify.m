function newImage = shadify(origImage, numShades)
% shadify
%
% Creates and returns a new image that is the image that results from
% applying the shadify filter to the original image. The shadify filter
% creates a poster-like effect by reducing the number of possible pixel
% values to 2, 3, or 4 (depending on the value of numShades).
%
% Input:
%   origImage    the original image
%   numShades    a valid number of shades (2, 3, or 4)
%
% Output: the image that results from applying the shadify filter to the
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
        % checks the number of shades chosen
        if numShades == 2
                newPixels(r, c) = twoShades <= origPixels(r, c);
                newPixels(r, c) = 255;  
        elseif numShades == 3
            if origPixels(r, c) <= 79
                newPixels(r, c) = 0;
            elseif origPixels(r, c) <= 143
                newPixels(r, c) = 128;
            else
                newPixels(r, c) = 255;
            end
        elseif numShades == 4
            if origPixels(r, c) <= 63
                newPixels(r, c) = 0;
            elseif origPixels(r, c) <= 119
                newPixels(r, c) = 84;
            elseif origPixels(r, c) <= 183
                newPixels(r, c) = 172;
            else
                newPixels(r, c) = 255;
            end
        end
    end
end

% convert new image from "regular" matrix format to jpg matrix format
newImage = matrix2jpg(newPixels);    
