%% CS310 Spring 2019 Homework Assignment 2c
% * Name: Amairani Zepeda
% * Team Lab: 303
% * Due Date: Friday, April 12 by 11:59 pm

clear

% The menu of choices to display to the user
options = [ 'Menu options:'; ...
            '1 - new image'; ...
            '2 - original '; ...
            '3 - negative '; ...
            '4 - sharpen  '; ...
            '5 - shadify  '; ...
            '6 - blur     '; ...
            '7 - save curr'];   

% Read in the digital image file bascomhill.jpg, set the current image, 
% and display the image
filename = 'bascomhill.jpg';
origImage = imread(filename, 'jpg');
imshow(origImage)
currImage = origImage;

% Repeatedly present the user with the menu of choices, prompt the user for 
% a choice, and perform the desired actions until the user enters 0 to quit
choice = 1;   
while choice ~= 0   

    disp(options)   
    choice = input('Enter choice (or 0 to quit): ');

    % Option 0: quit
    if choice == 0   
        disp('goodbye')
		
    % Option 1: loads a new image
    elseif choice == 1
        filename = input("Enter the new image file name: ", 's');
        origImage = imread(filename, 'jpg');
        imshow(origImage)
        currImage = origImage;
        
    % Option 2: restore current image to original and display
	elseif choice == 2
        currImage = origImage;
	    imshow(currImage)
		
    % Option 3: apply negative filter, update current image, and display
    elseif choice == 3
        currImage = negative(currImage);
        imshow(currImage)   
        
    % Options 4: sharpens the image, update current image, and display
    elseif choice == 4
        currImage = sharpen(currImage);
        imshow(currImage)
    
    % Options 5: apply shadify filter, update current image, and display
    elseif choice == 5
        numShades = getNumShades();
        currImage = shadify(currImage, numShades);
        imshow(currImage)
    
    % Options 6: apply blur filter, update current image, and display
    elseif choice == 6
        currImage = blur(currImage);
        imshow(currImage)

    % Option 7: save current image (with "NEW_" prepended to file name)
    elseif choice == 7
        imwrite(currImage, ['NEW_' filename], 'jpg'); 
        
    % Anything that is not one of the choices above is considered invalid
    else
        disp('invalid choice')
    end
    
end
