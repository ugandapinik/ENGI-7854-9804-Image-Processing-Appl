clc; 
clear all;
close all; 
image = imread("moonlanding.png");
FFT = fft2(image); % 2D DFT using FFT

spatial = imresize(ifft2(FFT),size(image));
figure('Name',"Spatial Domain")
imshow(spatial,[]);
title("Spatial Domain")

noise = 0.5;
size = rand(size(image));
noisy = find(size < noise/2);
image(noisy) = 0;
noisy = find(size >= noise/2 & size < noise);
image(noisy) = 1;

figure('Name',"Noisy")
imshow(image)
title("Periodic Noisy Image")