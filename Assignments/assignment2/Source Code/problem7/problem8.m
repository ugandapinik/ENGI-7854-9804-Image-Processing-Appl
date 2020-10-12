clc
clear all
close all
ima=imread('moonlanding.png'); 
ima = double(ima); 
figure(1); 
imshow(ima,[]); 
title('Original image'); 
imafft = fftshift(fft2(fftshift(ima)));
% Fourier Spectrum of Image
imafft2 = fft2(ima); 
imafft3 = fftshift(imafft2); 
s = size(ima); ma=max(max((imafft))); 
maxr = 0.5*sqrt(s(1)^2+s(2)^2); cutoff1 = maxr*30; 
cutoff2 = maxr*120; 
c=1; 
for i = 1 : s(1) 
    for j = 1 : s(2) r = sqrt((i-1-s(1)/2)^2+(j-1-s(2)/2)^2); 
        if( r < 30) z(i,j) = 0; 
        else if( r > 120) z(i,j) = 0; 
            else z(i,j) =511;
end
end
end
end
% Plots
imafft=imafft.*z/255;
ima_out = fftshift(ifft2(fftshift(imafft)));
ima_out =ima_out-ima; ima_out = 1-ima_out;
figure(2); imshow(ima_out,[]);
title('Filtered image (Ideal)');
figure(3); imshow(imafft3,[]);
title('Fourier Spectrum of Image')
imshow(z,[]);
title('Filtered');
d0=0;
d1=100;
n=4;

