% Kiranpreet Kaur
% Zaryab Farooq
% ECS 174
% seam_carving_decrease_width.m

im = (uint8(double(imread('mypic3.jpg'))));
originalImg = im;

ax1 = subplot(2,2,1);
imagesc(originalImg);
title('Original Image(480x360)');

for i=1:120
    energyImage = energy_img(im); 
    seamDirection = 'HORIZONTAL';
    cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
    horizontalSeam = find_horizontal_seam(cumulativeEnergyMap);
    %view_seam(im,verticalSeam,"VERTICAL");
    reducedColorImg = decrease_height(im,energyImage);
    im = reducedColorImg;
end

ax2 = subplot(2,2,2);
imagesc(im);    
title('System Resized Image: 120 rows removed');

matlabImg = imresize(originalImg, [240,480]);
ax3 = subplot(2,2,3);
imagesc(matlabImg);    
title('imresize()(480x240)');

linkaxes([ax1, ax2, ax3], 'xy');

