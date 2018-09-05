% Kiranpreet Kaur
% 04/20/2018
% view_seam

function view_seam(im, seam, seamDirection)
    
    if strcmp(seamDirection, 'VERTICAL')
        [~, row] = size(seam);

        for i=1:row
            column = seam(i);
            im(i, column, 1) = 255;
            im(i, column, 2) = 0;
            im(i, column, 3) = 0;
            
        end
        imshow(im);
    else
        [column, ~] = size(seam);
  
        for i=1:column
            row = seam(i);
            im(row, i, 1) = 255;
            im(row, i, 2) = 0;
            im(row, i, 3) = 0;
            
        end
        imshow(im);
    end
    
end