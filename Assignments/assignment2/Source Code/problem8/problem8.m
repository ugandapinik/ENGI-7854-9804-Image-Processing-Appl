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
butterworth_filter = butter_br(s(1),s(2),cutoff1,cutoff2,4);
gussian_filter=gaussian_br(s(1),s(2),cutoff1,cutoff2);
Ideal_filter= ideal_bp(s(1),s(2),100,105);
A = uint8(ifft(immultiply(real(imafft2),butterworth_filter)));
B = uint8(ifft(immultiply(real(imafft2),gussian_filter)));
C = uint8(ifft(immultiply(real(imafft2),Ideal_filter)));
figure(2);
imshow(A)
figure(3);
imshow(B)
figure(3);
imshow(C)
