function filter_image = filter_manual1(KernelNo, image)
    im = imread(image);
    grayscale_image = rgb2gray(im);
    grayscale_image = double(grayscale_image);
%     subplot(1,2,1);imshow(A,[]);
%     title('Original image') 
    % Read Kernels
    n = KernelNo;
    switch n
        case 6
        Kernel = [-1 0 1;-2 0 2;-1 0 1];
        case 7
        Kernel = [-1 -2 -1;0 0 0;1 2 1];
        case 8
        Kernel = fspecial('log',3);
    end 

        filter_image = convolution(grayscale_image,Kernel);
%         subplot(1,2,2);
        imshow(filter_image,[]);
        title('filtered image: Kernel 8') 
end