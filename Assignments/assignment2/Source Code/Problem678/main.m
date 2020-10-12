butterworth_filter = fftshift(butter_br(474,630,100,105,4));
gussian_filter = fftshift(gaussian_br(474,630,100,105))
Ideal_filter = fftshift(ideal_br(474,630,100,105))


subplot(1,3,1);
imshow(Ideal_filter);
title("Ideal Filter")
subplot(1,3,2);
imshow(butterworth_filter);
title("Butterworth Filter")
subplot(1,3,3);
imshow(gussian_filter);
title("Noisy Spectrum")
