% Zaryab Farooq
% KiranPreet Kaur
% decrease_width.m

function [reducedColorImg, reducedEnergyImg] = decrease_width(im,energyImg)
    [row, col, rgb] = size(im);
    newColorImg = uint8(zeros(row, col-1, rgb));
    
    %get verticalSeam to find which pixels to leave
    cumulativeEnergyMap = cumulative_min_energy_map(energyImg, "VERTICAL");
    verticalSeam = find_vertical_seam(cumulativeEnergyMap);
    
    for i=1:row
        j = verticalSeam(i);
        newColorImg(i,1:j-1,:) = im(i,1:j-1,:);
        newColorImg(i,j:col-1,:) = im(i,j+1:col,:);
        
    end

    reducedColorImg = newColorImg;
    reducedEnergyImg = energy_img(newColorImg);

end

