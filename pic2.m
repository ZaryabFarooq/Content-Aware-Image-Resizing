% Kiranpreet Kaur
% Zaryab Farooq
% ECS 174
% seam_carving_decrease_width.m

im = (uint8(double(imread('mypic2.jpg'))));
originalImg = im;

ax1 = subplot(2,2,1);
imagesc(originalImg);
title('Original Image(480x360)');

for i=1:200
    energyImage = energy_img(im); 
    seamDirection = 'VERTICAL';
    cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
    verticalSeam = find_vertical_seam(cumulativeEnergyMap);
    %view_seam(im,verticalSeam,"VERTICAL");
    reducedColorImg = decrease_width(im,energyImage);
    im = reducedColorImg;
end

ax2 = subplot(2,2,2);
imagesc(im);    
title('System Resized Image: 200 columns removed');

matlabImg = imresize(originalImg, [360, 280]);
ax3 = subplot(2,2,3);
imagesc(matlabImg);    
title('imresize()(280x360)');

linkaxes([ax1, ax2, ax3], 'xy');

