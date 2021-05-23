% HSI color space
%21811957 jeongbomi
hsi=rgb2hsi(I);
figure(2); subplot(2,3,2); imshow(I); title('RGB image');
H=hsi(:,:,1);
S=hsi(:,:,2);
I=hsi(:,:,3);
figure(2); subplot(2,3,4); imagesc(H); title('Hue'); axis image;
figure(2); subplot(2,3,5); imagesc(S); title('Saturation'); axis image
figure(2); subplot(2,3,6); imshow(I); title('Intensity');
