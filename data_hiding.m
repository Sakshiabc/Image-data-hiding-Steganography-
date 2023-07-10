%% Data hiding method using bit plane slicing technique %%
clc;    %clear command window
clear;   %clear workspace
close;   %close all current figures
a=imread('lena.bmp');
figure(1);   %figure number
imshow(a);   %displaying the image
title('original image');  %title of image
[m, n, o]=size(a);  %storing length of each dimension in a seperate variable
figure(2);
imshow(a(:,:,1));   %displaying the first plane (red plane)
title('red plane');
% figure(3);
% imshow(a(:,:,2));  %displaying the second plane (blue plane)
% title('blue plane');
% figure(4);
% imshow(a(:,:,3));   %displaying the third plane (green plane)
% title('green plane');

%Displaying all the planes
R(:,:)=a(:,:,1);   %all rows and columns of first plane to variable R
for i=1:m                %all rows
    for j=1:n           % all columns
        for k=1:8        % 8 number of planes
            bitplaneR(i,j,k)=bitget(a(i,j,1),k);    %returns the bit value at position kth bit in integer array a.
        end
    end
end
for i=1:8
    figure(5);
    subplot(2,4,i);   %ploting all 8 planes
    titleString='bit planes (red plane)';
    imagesc(uint8(bitplaneR(:,:,i)));  %displays the data in array R as an image that uses the full range of colors in the colormap. 
    axis equal;
    colormap(gray);  %Plot a surface and assign the gray colormap.
    title([titleString int2str(i-1)]);    %giving title to each and every plots
end 

% G(:,:)=a(:,:,3);  %all rows and columns of second plane to variable R
% for i=1:m
%     for j=1:n
%         for k=1:8
%             bitplaneG(i,j,k)=bitget(a(i,j,3),k);
%         end
%     end
% end
% for i=1:8
%     figure(6);
%     subplot(2,4,i);
%     titleString='bit planes (green plane)';
%     imagesc(uint8(bitplaneG(:,:,i)));
%     axis equal;
%     colormap(gray);
%     title([titleString int2str(i-1)]);
% end
% 
% B(:,:)=a(:,:,2);    %all rows and columns of third plane to variable R
% for i=1:m
%     for j=1:n
%         for k=1:8
%             bitplaneB(i,j,k)=bitget(a(i,j,2),k);
%         end
%     end
% end
% for i=1:8
%     figure(7);
%     subplot(2,4,i);
%     titleString='bit planes (red plane)';
%     imagesc(uint8(bitplaneB(:,:,i)));
%     axis equal;
%     colormap(gray);
%     title([titleString int2str(i-1)]);
% end

%Displaying all planes after embedding data in 2 planes from all 8 planes
bitplaneR(:,:,1)=0;    %now embedding data
bitplaneR(:,:,2)=0;
for i=1:8
    figure(8);
    subplot(2,4,i);
    titleString='bit planes (red plane)'
    imagesc(uint8(bitplaneR(:,:,i)));
    axis equal;
    colormap(gray);
    title([titleString int2str(i-1)]);
end

%Now reconstructing the red plane after embedding data in the 1st and 2nd plane
b1=zeros(m,n);      %constructing a zero matrix b1 of m number of rows and n nummber of columns 
for i=1:m
    for j=1:n
        for k=1:8
            b1(i,j)=b1(i,j)+bitplaneR(i,j,k)*(2^(k-1));   %putting all the values of planes in b1 matrix
        end
    end
end
figure(9),
imshow(uint8(b1));
title('Reconstructed red plane');
b1=uint8(b1);

%Result and analysis, SSIM and PSNR
ssim(b1,R)   %Structural Similarity Index for quantifying image quality degradation
psnr(b1,R)   %Peak Signal to Noise Ratio is used to measure the quality of reconstruction of lossy and lossless compression