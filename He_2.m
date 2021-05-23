% Equalization
I=imread('light.tif');
I=rgb2gray(I);
figure(1);subplot(2,2,1);imshow(I);title('Original');
% h1=imhist(I,256);
% bar(h1);
[count center]=hist(double(I(:)),0:255);
figure(1);subplot(2,2,2);bar(center,count);title('Histogram');

Ih=histeq(I,256);
figure(1);subplot(2,2,3);imshow(Ih);title('Histogram equalized');

[count2 center2]=imhist(Ih,256);%h2=imhist(Ih,256);bar(h2);
figure(1);subplot(2,2,4);bar(center2,count2);title('Histogram');