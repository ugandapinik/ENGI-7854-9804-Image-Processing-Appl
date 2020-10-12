clc
clear all
close all
image = imread('moonlanding.png'); 
image = double(image); 
figure(1); 
imshow(image,[]); 
title('Original Image'); 
imafft = fftshift(fft2(fftshift(image)));
% Fourier Spectrum of Image
imafft2 = fft2(image); 
imafft3 = fftshift(imafft2); 
size = size(image); ma=max(max((imafft))); 


butterworth_filter = fftshift(butter_br(474,630,100,105,4));
gussian_filter = fftshift(gaussian_br(s(1),s(2),cutoff1,cutoff2));
Ideal_filter = fftshift(ideal_br(s(1),s(2),100,105));

butter = (immultiply(real(FS),butterworth_filter));
gussian = (immultiply(real(FS),gussian_filter));
ideal = (immultiply(real(FS),Ideal_filter));


imafft=imafft.*z/255;
image_out = fftshift(ifft2(fftshift(imafft)));
image_out =image_out-image; image_out = 1-image_out;
figure(2); imshow(image_out,[]);
title('Gaussian Filtered Image');

