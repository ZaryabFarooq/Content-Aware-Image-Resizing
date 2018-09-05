%

function [reducedColorImg, reducedEnergyImg] = decrease_height(im,energyImg)
    im = permute(im, [2 1 3]) ;
    [row, col, rgb] = size(im);
    newColorImg = uint8(zeros(row, col-1, rgb));
    
    %get verticalSeam to find which pixels to leave
    cumulativeEnergyMap = cumulative_min_energy_map(energyImg, 'HORIZONTAL');
    horizontalSeam = find_horizontal_seam(cumulativeEnergyMap);
    
    for i=1:row
        j = horizontalSeam(i);
        newColorImg(i,1:j-1,:) = im(i,1:j-1,:);
        newColorImg(i,j:col-1,:) = im(i,j+1:col,:);
        
    end
    
    newColorImg = permute(newColorImg, [2 1 3]) ;
    reducedColorImg = newColorImg;
    reducedEnergyImg = energy_img(newColorImg);
end



