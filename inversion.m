I=imread('breast.tif');
figure(1);subplot(1,2,1);imshow(I);
title('Original');

In=255-I;
subplot(1,2,2);imshow(In);title('inversion');