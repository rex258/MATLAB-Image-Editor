function numShades = getNumShades()
% getNumShades
%
% Repeatedly prompts the user to enter the number of grayscale shades
% until a valid number has been entered. To be considered valid, the 
% number of shades must be one of the following scalar values: 2, 3, 4
% 
% Input:
%   none
%
% Output: a valid number of shades of gray
%

valid = false;
while ~valid
    numShades = input("Enter a shade value: ");
    % checks that the user input is valid
    if numShades == 2 || numShades == 3 || numShades == 4
        valid = true;
    end
end

