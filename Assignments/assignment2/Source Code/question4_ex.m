clc; % clear you command window
clear all; % clear workspace
close all; %close all the files
y = (imread("moonlanding.png"));
F=fft2(y); %perform 2D DFT using FFT algorithmfigure, 
%FS = fftshift(log(1+abs(F)));
figure('Name',"iverse")
imshow(ifft2(F),[]);