function [filtered_image] = medianfilter(image,size_of_filter)
    green  = image(:,:,2);
    [rows,cols] = size(green);    
    pad = size_of_filter-1; 
    nimage = zeros(rows + pad,cols + pad); 
    nimage(pad/2+1:rows+pad/2, pad/2+1:cols+pad/2) = green;
    filtered_image = zeros(rows,cols);  
    for x = pad/2 + 1 : cols + pad/2  
        for y = pad/2 + 1 : rows + pad/2   
            if nimage(y,x) == 0 || nimage(y,x) == 255
                win = nimage(y-pad/2:y+pad/2, x-pad/2:x+pad/2);  
        % find median	
                filtered_image(y-pad/2,x-pad/2) = median(win(:));      
            else
                filtered_image(y-pad/2,x-pad/2) = nimage(y,x);
            end
              % get mxm window
            win = nimage(y-pad/2:y+pad/2, x-pad/2:x+pad/2);
          % find median  
            filtered_image(y-pad/2,x-pad/2) = median(win(:));      
        end
    end

    filtered_image=uint8(filtered_image);
    imshow(filtered_image);

end
