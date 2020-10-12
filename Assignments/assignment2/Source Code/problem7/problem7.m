clc
clear all
close all
image =imread('moonlanding.png'); 
image = double(image); 

 
imafft = fftshift(fft2(fftshift(image)));
% Fourier Spectrum of imagege
imafft2 = fft2(image); 
FS=fftshift(imafft2);
FS=fftshift(log(1+abs(FS)));


butterworth_filter = fftshift(butter_br(474,630,100,105,4));
gussian_filter = fftshift(gaussian_br(474,630,100,105));
Ideal_filter = fftshift(ideal_br(474,630,100,105));


A = (immultiply(real(FS), butterworth_filter));
B = (immultiply(real(FS), gussian_filter));
C = (immultiply(real(FS), Ideal_filter));

% figure(1)
% imshow(A)

figure(2)
imshow(B)

figure(3)
imshow(C)
