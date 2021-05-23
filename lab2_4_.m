grayImage=imread('rice.png');
figure(1); subplot(1,2,1); imagesc(grayImage);
title({'Input gray image';'21811957 정보미'});

brightBlobs = grayImage > 128; % Find bright things.
figure(1); subplot(1,2,2); imagesc(brightBlobs);
title({'Binary image';'21811957 정보미'});

gray2Image=rgb2gray(grayImage);
brightBlobs2 = gray2Image > 128;
L2 = bwlabel(brightBlobs2,8) % blob labeling with 8 adjacency
figure(2), imagesc(L2); colormap jet
title({'Blob labeling';'21811957 정보미'}); colorbar;
