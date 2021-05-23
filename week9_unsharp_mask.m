clear all; close all;
% load 
I=imread('moon.bmp');
Ig=rgb2gray(I);
figure(1);subplot(5,1,1);imshow(Ig);title('origin');

% blurring
w=fspecial('gaussian',[5 5],1); % make a gaussian kernel
Ib=imfilter(Ig,w,'same','replicate'); % convolution
figure(1);subplot(5,1,2);imshow(Ib);title('blurred');

% unsharp mask=input-blurred
Iu=Ig-Ib;
figure(1);subplot(5,1,3);imagesc(Iu);title('unsharp mask=input-blurred');axis image;
colormap gray;

% sharpening: input + unsharp mask
Is=Ig+Iu;
figure(1);subplot(5,1,4);imshow(Is);title('sharpened image');

% highboost: input + 5*(unsharp mask)
Ih=Ig+5*Iu;
figure(1);subplot(5,1,5);imshow(Ih);title('Boosted image');
