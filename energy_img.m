% Kiranpreet Kaur
% 04/20/2018
% energyImg

function energyImg = energy_img(im)
    im = rgb2gray(im);  %converting to grayscale
    %im = imadjust(im);
    %im = imgaussfilt(im,2);
    [dx, dy] = imgradient(im);  % get the dx and dy
    energyImg = double(sqrt(dx.^2 + dy.^2));  % energy image from the formulae
end 



