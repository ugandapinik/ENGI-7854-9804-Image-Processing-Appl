clc;
clear all;
% convert the image to a grayscale image. Obtain the padding parameters and FT the image
F_rgb=imread('puppy.jpg'); % read the gs image
F=rgb2gray(F_rgb);
im_size=size(F); % Obtain the size of the image
P=2*im_size(1);Q=2*im_size(2); % Optaining padding parameters as 2*image size
FTIm=fft2(double(F),P,Q); % FT with padded size



% Design the ILPF
D0 = 0.1*im_size(1); %Cutoff freqency radius is 0.1 times the the hight of the image
n=0; %For use only in Butterworth filters. For BTW filters, Order(n)>0
%Filter_type=('ideal' or 'btw' or 'gaussian')
%lp_or_hp=('lp' or 'hp' for low pass or high pass),
Filter = lp_hp_filters('ideal','lp', P, Q, D0,n); % Calculate the LPF

% Implement the filter by multiplying the FT of the image with filter. Undo padding
Filtered_image=real(ifft2(Filter.*FTIm)); % multiply the FT of image by the filter and apply the IDFT
Filtered_image=Filtered_image(1:im_size(1), 1:im_size(2)); % Resize the image ( undo padding)


% Move the origin of frequency spectrum to the center and display the results
Fim=fftshift(FTIm); % move the origin of the FT to the center
FTI=log(1+abs(Fim)); % compute the magnitude (log to brighten display)
Ff=fftshift(Filter); % move the origin of the FT to the center
FTF=log(1+abs(Ff)); % compute the magnitude (log to brighten display)



subplot(2,2,1), imshow(F,[]), title('Original Image'); % show the image
subplot(2,2,2), imshow(FTI,[]), title('FT of Original'); % show the image 
subplot(2,2,3), imshow(FTF,[]), title('Filter in frequency domain'); % filter
subplot(2,2,4), imshow(Filtered_image,[]), title('Filtered Image'); % show the image


