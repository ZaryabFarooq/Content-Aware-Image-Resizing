% Kiranpreet Kaur
% 04/20/2018
% verticalSeam

function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)    
    horizontalSeam = [];
    transCum = transpose(cumulativeEnergyMap);
    [maxRow, maxCol] = size(transCum);
    
    % to get the column of the min number
    [~, c] = min(transCum(maxRow,:));
    
    horizontalSeam(maxRow) = c;   % add the last col index
    
    % taking min element, starting from 2nd-last row going up
    for i=maxRow-1:-1:1
        if c==1 % if the first column, then check top and top right
            [~, pos] = min([transCum(i,c), transCum(i,c+1)]);
            if pos == 1
                horizontalSeam(i) = c;
            else
                horizontalSeam(i) = c+1;
                c = c+1;
            end
            
        elseif c==maxCol %check top and top left
            [~, pos] = min([transCum(i,c-1), transCum(i,c)]);
            if pos == 1
                horizontalSeam(i) = c-1;
                c = c - 1;
            else
                horizontalSeam(i) = c;
            end
            
        else   % check all top thre
            [~, pos] = min([transCum(i,c-1), transCum(i,c), transCum(i,c+1)]);
             if pos == 1
                horizontalSeam(i) = c-1;
                c = c - 1;
            elseif pos == 2
                horizontalSeam(i) = c;
            else
               horizontalSeam(i) = c+1;
               c = c+1;
             end
        end
    end
    horizontalSeam = transpose(horizontalSeam);
end


