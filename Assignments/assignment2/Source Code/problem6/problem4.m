IM=imread('data.png');  % Read in a image
                  % Display image
FF = fft(IM);                   % Take FFT
IFF = ifft(FF);                 % take IFFT
subplot(1,2,1);imshow(FF)
FINAL_IM = uint8(real(IFF));      % Take real part and convert back to UINT8
subplot(1,2,2);
imshow(FINAL_IM)       % Get back original image.
