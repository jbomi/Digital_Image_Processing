% load a gray image
im = imread('rice.png');
grayImage=rgb2gray(im);
figure(1), subplot(1,2,1); imshow(grayImage);
title('Input gray image');
% thresholding
brightBlobs = grayImage > 128; % Find bright things.
figure(1), subplot(1,2,2); imshow(brightBlobs);
title('Binary image');
% labeling
L2 = bwlabel(brightBlobs,8) % blob labeling with 8 adjacency
figure(2), imagesc(L2); colormap jet
title('Blob labeling'); colorbar;