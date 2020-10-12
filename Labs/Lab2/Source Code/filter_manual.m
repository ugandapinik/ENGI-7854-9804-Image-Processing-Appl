function filter_image = filer_manual(KernelNo, image)
    im = imread(image);
    % RGB to gray
    grayscale_image = rgb2gray(im);
    grayscale_image = double(grayscale_image);
%     subplot(1,2,1);
    imshow(grayscale_image,[]);
    title('Original image') 
    % Read Kernels
    n = KernelNo;
    switch n
        case 1
        Kernel = (1/9)*ones(3);
        case 2
        Kernel = (1/49)*ones(7);
        case 3
        Kernel = fspecial('average',[7,7]);
        case 4
        Kernel = fspecial('gaussian',[3,3],0.5);
        case 5
        Kernel =fspecial('gaussian',[7,7],1.2);
        case 6
        Kernel = [-1 0 1;-2 0 2;-1 0 1];
        case 7
        Kernel = [-1 -2 -1;0 0 0;1 2 1];
        case 8
        Kernel = fspecial('log',3);
    end 

    filter_image = convolution(grayscale_image, Kernel);
%     subplot(1,2,2);
%     imshow(filter_image,[]);
%     title('Filtered image: Kernel 5') 
    
end