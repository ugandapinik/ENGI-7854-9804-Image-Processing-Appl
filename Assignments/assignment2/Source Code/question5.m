clc; 
clear all; 
close all; 
image = (imread("moonlanding.png"));
FFT = fft2(image); %perform 2D DFT using FFT algorithmfigure, 
%FS = fftshift(log(1+abs(F)));
spatial = imresize(ifft2(FFT), size(image))
points = 0.5;
x = rand(size(image));
noisy = find(x < points/2);
image(noisy) = 0;
noisy = find(x >=points/2 & x < points);
image(noisy) = 1;

FFT = fft2(image);
ShiftedImage = fftshift(log(1+abs(FFT)));
imshow(ShiftedImage,[]);
title('Spectrum with Periodic Noice');