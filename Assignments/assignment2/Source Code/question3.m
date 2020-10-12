clc;
clear all; 
close all; 
image = imread('moonlanding.png'); 
F = fft2(image); %Convert spatial domain to Frequency Domain
FS = fftshift(log(1+abs(F))); %Calculate the DFT.
FSmax = max(FS(:)); %Find the maximum frequency
[A B] = size(FS);
CRDr = 100;
CRx = B/2;
CRy = A/2;
th = 0:pi/5:2*pi;
% Display The figure in frequency domain
imshow(FS,[])
title('Noisy Spectrum');


hold on
th = 0:pi/4:2*pi;
xunit = CRDr * cos(th) + CRx;
yunit = CRDr * sin(th) + CRy;
%scatter(xunit, yunit, 20,'filled');
scatter(xunit,yunit,1,'MarkerEdgeColor',[1 1 1], 'LineWidth', 3.0)
hold off
frame_index = 1;
F = getframe ;

imwrite(F.cdata, 'data.png')
