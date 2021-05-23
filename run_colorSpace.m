I=imread('color.jpg');

% RGB color space
figure(1); subplot(2,3,2); imshow(I); title('RGB image');
R=uint8(zeros(size(I))); R(:,:,1)=I(:,:,1);
G=uint8(zeros(size(I))); G(:,:,2)=I(:,:,2);
B=uint8(zeros(size(I))); B(:,:,3)=I(:,:,3);
figure(1); subplot(2,3,4); imshow(R); title('Red plane');
figure(1); subplot(2,3,5); imshow(G); title('Green plane');
figure(1); subplot(2,3,6); imshow(B); title('Blue plane');

% HSI color space
hsi=rgb2hsi(I);
figure(2); subplot(2,3,2); imshow(I); title('RGB image');
H=hsi(:,:,1);
S=hsi(:,:,2);
I=hsi(:,:,3);
figure(2); subplot(2,3,4); imagesc(H); title('Hue'); axis image; 
figure(2); subplot(2,3,5); imagesc(S); title('Saturation'); axis image
figure(2); subplot(2,3,6); imshow(I); title('Intensity');
