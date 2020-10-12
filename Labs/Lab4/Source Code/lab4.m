image = imread('image.png');
[rows, columns, numberOfColorChannels] = size(image);

% Display the original image
figure(1)
imshow(image);
title('Original Image');


% add padding 1/4 size of the image
Im1 = padarray(image, 1/4*[rows columns], 0, 'both');


figure(2)
imshow(Im1);
title('Padded Image');

T1 = maketform('affine', [1 0 0; 0 1 0; 90 90 1]);
Im2 = imtransform(Im1, T1, ...
'XData',[1 size(Im1,1)], 'YData',[1 size(Im1,2)]);

figure(3)
imshow(Im2)


% figure(3)
% imshow(Im2)
% T2 = maketform('affine', [0.5 0 0; 0 0.5 0; 0 0 1]);
% Im3 = imtransform(Im1, T2, ...
% 'XData',[1 size(Im1,1)], 'YData',[1 size(Im1,2)]);
% 
% figure(4)
% imshow(Im3);
% T3 = maketform('affine', [cos(pi/4) sin(pi/4) 0; -sin(pi/4) cos(pi/4) 0; 0 0 1]);
% Im4 = imtransform(Im1, T3, ...
% 'XData',[-269 size(Im1,1)-270], 'YData',[+111 size(Im1,2)+110]);
% 
% figure(5)
% imshow(Im4)
% T4 = maketform('affine', [cos(pi/2) sin(pi/2) 0; -sin(pi/2) cos(pi/2) 0; 0 0 1]);
% Im5 = imtransform(Im1, T4, ...
% 'XData',[-539 size(Im1,1)-540], 'YData',[1 size(Im1,2)]);
% 
% figure(6)
% imshow(Im5)
% Im6=flipdim(Im1,2);
% 
% figure(7)
% imshow(Im6)
% Moment_invariants(Im1)
% Moment_invariants(Im2)
% Moment_invariants(Im3)
% Moment_invariants(Im4)
% Moment_invariants(Im5)
% Moment_invariants(Im6)
