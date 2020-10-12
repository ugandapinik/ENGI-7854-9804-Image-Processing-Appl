clc;
F=imread('puppy.jpg');
F=rgb2gray(F);
im_size=size(F);
p=2*im_size(1);Q=2*im_size(2);
FTIm=fft2(double(F),p,Q);
D0= 0.3*im_size(1)
n=0
Filter=lp_hp_filters('gaussian','lp',p,Q,D0,n);
Filtered_image=real(ifft2(Filter.*FTIm));
Filtered_image=Filtered_image(1:im_size(1),1:im_size(2));
Fim=fftshift(FTIm);
FTI=log(1+abs(Fim));
Ff=fftshift(Filter);
FTF=log(1+abs(Ff));
subplot(2,2,1),imshow(F,[]),title('original image');
subplot(2,2,2),imshow(FTI,[]),title('FT of original');
subplot(2,2,3),imshow(FTF,[]),title('Filter in frequency domain');
subplot(2,2,4),imshow(Filtered_image,[]),title('Filtered image');
