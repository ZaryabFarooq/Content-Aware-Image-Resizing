% Kiranpreet Kaur
% Zaryab Farooq
% ECS 174
% greedySolutionEC.m

im = (uint8(double(imread('mypic3.jpg'))));


for i=1:200
    verticalSeam = greedySolutionEC2(im);
    view_seam(im,verticalSeam,"VERTICAL");
    
    % decrease width
    [row, col, rgb] = size(im);
    newColorImg = uint8(zeros(row, col-1, rgb));
    
    for k=1:row
        j = verticalSeam(k);
        newColorImg(k,1:j-1,:) = im(k,1:j-1,:);
        newColorImg(k,j:col-1,:) = im(k,j+1:col,:);
        
    end    
    im = newColorImg;
    
end

figure(1);
imagesc(im);
