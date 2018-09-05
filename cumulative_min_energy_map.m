% Kiranpreet Kaur
% 04/20/2018
% cumulativeEnergyMap


function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
    
    [rows, columns] = size(energyImg);
    M = zeros(size(energyImg));
    
    
    if strcmp(seamDirection, 'VERTICAL')
            
        M(1,:) = energyImg(1,:);
        
        for i = 2:rows
            for j = 1:columns
                if j == 1
                    M(i,j) = min([M(i-1, j), M(i-1, j+1)]);
                
                elseif j == columns
                    M(i,j) = min([M(i-1, j-1), M(i-1, j)]);
                
                else
                    M(i,j) = min([M(i-1,j-1), M(i-1, j), M(i-1, j+1)]);
                end
                M(i,j) = M(i,j) + energyImg(i, j);
            end
        end
        
    elseif strcmp(seamDirection,'HORIZONTAL')
      M(:,1) = energyImg(:,1);
      
      trans = transpose(M);
      transImg = transpose(energyImg);
      
      [rows, columns] = size(transImg);
      
      for i = 2:rows
            for j = 1:columns         
                if j == 1
                    trans(i,j) = min([trans(i-1, j), trans(i-1, j+1)]);
                 
                elseif j == columns
                    trans(i,j) = min([trans(i-1, j-1), trans(i-1, j)]);
                  
                else 
                    
                    trans(i,j) = min([trans(i-1,j-1), trans(i-1, j), trans(i-1, j+1)]);
                end
                trans(i,j) = trans(i,j) + transImg(i, j);
            end
      end
      M = transpose(trans); % make the image normal again
    
    end
    cumulativeEnergyMap = M;
end