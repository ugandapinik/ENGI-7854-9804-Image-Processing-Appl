I = imread('image.png');
figure(1)
imshow(I)
title("Original Image")
[rows, columns, numberOfColorChannels] = size(I)

% % We can also add padding using loops
% padding one fourth of size of image (manually)
% for i=1:360
%     for j=1:90
%         I(i,j)=0;
%     end
% end
% for i=1:90
%     for j=1:360
%         I(i,j)=0;
%     end
% end
% for i=271:360
%     for j=1:360
%         I(i,j)=0;
%     end
% end
% for i=1:360
%     for j=271:360
%         I(i,j)=0;
%     end
% end
% ===================================================

%=========================================================
% We can also use 
% Im1 = padarray(I, 1/4* [rows columns], 0, 'both')
% to add the padding one fourth of size of the image. 
% ========================================================


% Display the padded image
Im1=I;
figure(2)
imshow(Im1);
title("Padded Image: Im1")



% 3. Create spatial transformation matrix T1 for translation as follows
T1 = maketform('affine', [1 0 0; 0 1 0; 90 90 1]);
% perform transformation using transformation matrix T1
Im2 = imtransform(Im1, T1, ...
'XData',[1 size(Im1,1)], 'YData',[1 size(Im1,2)]);
figure(3)
imshow(Im2)
title('Translated Image: Im2');


% 4. Create spatial transformation matrix T2 for scaling to 0.5 (of original size) as follows:
T2 = maketform('affine', [0.5 0 0; 0 0.5 0; 0 0 1]);
% Use the above transformation matrix T2 and perform the transformation as follows:
Im3 = imtransform(Im1, T2, ...
'XData',[1 size(Im1,1)], 'YData',[1 size(Im1,2)]);
figure(4)
imshow(Im3);
title("Translated Image: Im3")


% 5. Create spatial transformation matrix T3 to rotate the image by 45 degrees as follows:
T3 = maketform('affine', [cos(pi/4) sin(pi/4) 0; -sin(pi/4) cos(pi/4) 0; 0 0 1]);
Im4 = imtransform(Im1, T3, ...
'XData',[-269 size(Im1,1)-270], 'YData',[+111 size(Im1,2)+110]);
figure(5)
imshow(Im4)
title("Translated Image: Im4")



% 6. Create spatial transformation matrix T4 for rotating the image 90 degrees as follows:
T4 = maketform('affine', [cos(pi/2) sin(pi/2) 0; -sin(pi/2) cos(pi/2) 0; 0 0 1]);
Im5 = imtransform(Im1, T4, ...
'XData',[-539 size(Im1,1)-540], 'YData',[1 size(Im1,2)]);
figure(6)
imshow(Im5)
title("Translated Image: Im5")


% 7. Flip the original image Im1 from left to right using following command and generate image Im6.
Im6 = flipdim(Im1,2);
figure(7)
imshow(Im6)
title("Mirror Image") 







% Calculating the moment invariants
Moment_invariants(Im1)
Moment_invariants(Im2)
Moment_invariants(Im3)
Moment_invariants(Im4)
Moment_invariants(Im5)
