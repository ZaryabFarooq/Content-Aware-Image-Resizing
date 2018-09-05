% Kiranpreet Kaur
% Zaryab Farooq
% ECS 174
% seam_carving_decrease_width.m

im = (uint8(double(imread('inputSeamCarvingPrague.jpg'))));


for i=1:100
    energyImage = energy_img(im); 
    seamDirection = 'VERTICAL';
    cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
    verticalSeam = find_vertical_seam(cumulativeEnergyMap);
    view_seam(im,verticalSeam,"VERTICAL");
    reducedColorImg = decrease_width(im,energyImage);
    im = reducedColorImg;
end

figure(1);
imagesc(im);
imwrite(im,'outputReduceWidthPrague.png');