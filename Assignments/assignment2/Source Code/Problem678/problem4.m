clc; % clear you command window
clear all; % clear workspace
close all; %close all the files
y = (imread("moonlanding.png"));
F=fft2(y); %perform 2D DFT using FFT algorithmfigure, 
%FS = fftshift(log(1+abs(F)));
spatial = imresize(ifft2(F),size(y))
figure('Name',"Spatial Domain ")
imshow(spatial,[]);
 
p = 0.5;
x = rand(size(y));
d = find(x < p/2);
y(d) = 0;
d = find(x >=p/2 & x < p);
y(d) = 1;
figure('Name',"noise")
imshow(y)