% Kiranpreet Kaur
% Zaryab Farooq
% ECS 174
% seam_carving_decrease_height.m

im = (uint8(double(imread('inputSeamCarvingPrague.jpg'))));


for i=1:50
    energyImage = energy_img(im); 
    seamDirection = 'HORIZONTAL';
    cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
    horizontalSeam = find_horizontal_seam(cumulativeEnergyMap);
    view_seam(im,horizontalSeam,"HORIZONTAL");
    reducedColorImg = decrease_height(im,energyImage);
    im = reducedColorImg;
end

figure(1);
imagesc(im);
imwrite(im,'outputReduceHeightPrague.png');