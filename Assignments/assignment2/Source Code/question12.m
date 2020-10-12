clc; 
clear all; 
close all;

% Read image
image = imread('moonlanding.png');
imshow(image)

%Convert image from spatial domain to Frequency Domain
FD = fft2(image); 
FS = fftshift(log(1+abs(FD))); 

%Find the maximum frequency in S
FSmax = max(FS(:));
imshow(FS,[]) % Display The figure in frequency domain

disp(FSmax)

findex = 1;
F = getframe;
imwrite(F.cdata, 'fdata.png')
