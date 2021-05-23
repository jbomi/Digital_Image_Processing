I=imread('color.png');
% RGB color space
figure(1); subplot(2,3,2); imshow(I); title('RGB image');
R=uint8(zeros(size(I))); R(:,:,1)=I(:,:,1);
G=uint8(zeros(size(I))); G(:,:,2)=I(:,:,2);
B=uint8(zeros(size(I))); B(:,:,3)=I(:,:,3);
figure(1); subplot(2,3,4); imshow(R); title('Red plane');
figure(1); subplot(2,3,5); imshow(G); title('Green plane');
figure(1); subplot(2,3,6); imshow(B); title('Blue plane');