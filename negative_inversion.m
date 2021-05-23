I=imread('breast.tif');
figure(1);subplot(1,2,1);imshow(I);title('original');
s=255-I;
figure(1);subplot(1,2,2);imshow(s);title('negative');
