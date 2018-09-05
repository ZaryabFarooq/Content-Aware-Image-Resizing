% Kiranpreet Kaur
% Zaryab Farooq
% ECS 174
% Script


% Part 1
im = (uint8(double(imread('inputSeamCarvingPrague.jpg'))));
energyImage = energy_img(im); 
figure(1);
imagesc(energyImage);

% Part 2
seamDirection = 'VERTICAL';
cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
figure(2);
imagesc(cumulativeEnergyMap);

% Part 3
verticalSeam = find_vertical_seam(cumulativeEnergyMap);

% Part 2
seamDirection = 'HORIZONTAL';
cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
figure(3);
imagesc(cumulativeEnergyMap);

% Part 4
horizontalSeam = find_horizontal_seam(cumulativeEnergyMap);

% Part 5
figure(4);
view_seam(im,verticalSeam,"VERTICAL");

figure(5);
view_seam(im,horizontalSeam,"HORIZONTAL");

% Part 6
