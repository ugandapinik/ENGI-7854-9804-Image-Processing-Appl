clc
clear all
close all
image=imread('moonlanding.png'); 
image = double(image); 
imafft = fft2(image);
FS = fftshift(imafft);
% % Fourier Spectrum of Image 
s = size(image); ma=max(max((FS))); 
maxium = 0.5*sqrt(s(1)^2+s(2)^2); 
cutoff1 = maxium*30; 
cutoff2 = maxium*120; 
 
butterworth_filter = fftshift(butter_br(474,630,100,105,4));
gussian_filter = fftshift(gaussian_br(s(1),s(2),cutoff1,cutoff2));
Ideal_filter = fftshift(ideal_br(s(1),s(2),100,105));

butter = (immultiply(real(FS),butterworth_filter));
gussian = (immultiply(real(FS),gussian_filter));
ideal = (immultiply(real(FS),Ideal_filter));
figure(1);
imshow(butter)
title("Butter Filtered Image")
figure(2);
imshow(gussian)
title("Gussian Filtered Image")
figure(3);
imshow(ideal)
title("Ideal Filtered Image")
