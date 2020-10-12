clc; % clear you command window
clear all; % clear workspace
close all; %close all the files
r=imread('moonlanding.png'); % Read image store in varliable r
%subplot(1,2,1);
%imshow(r) % Diaply Original Figure
F=fft2(r); %Convert image from spatial domain to % Frequency Domain
FS=fftshift(log(1+abs(F))); %Calculate the DFT. Notice how there are real and imaginary parts to F. You must use abs to compute the magnitude (square root of the sum of the squares of the real and imaginary parts). 
FSmax = max(FS(:))%Find the maximum frequency in S
[A B] =size(FS);
CRr=100;
CRx =B/2;
CRy=A/2;
th = 0:pi/4:2*pi;
 
%subplot(1,2,2);
imshow(FS,[]) % Display The figure in frequency domain
hold on
th = 0:pi/4:2*pi;
xunit = CRr * cos(th) + CRx;
yunit = CRr * sin(th) + CRy;
%scatter(xunit, yunit, 20,'filled');
scatter(xunit,yunit,1,'MarkerEdgeColor',[1 1 1],...
              'MarkerFaceColor',[1 1 1],...
              'LineWidth',1.5)
hold off
% for this example I show the image
 
frame_index = 1;
F = getframe ;
imwrite(F.cdata, 'data.png')
