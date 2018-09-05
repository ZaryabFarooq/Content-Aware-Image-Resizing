% Kiranpreet Kaur
% Zaryab Farooq
% ECS 174
% seam_carving_decrease_width.m

im = (uint8(double(imread('mypic1.jpg'))));
originalImg = im;

ax1 = subplot(2,2,1);
imagesc(originalImg);
title('Original Image (960 x 635)');

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
title('System Resized Image: 200 columns removed ');

matlabImg = imresize(originalImg, [635, 760]);
ax3 = subplot(2,2,3);
imagesc(matlabImg);    
title('imresize() (760 x 635)');

linkaxes([ax1, ax2, ax3], 'xy');
