% image Load
Ic=imread('hw.jpg');
figure(1);imshow(Ic);title('Color image','fontsize',14);

size(Ic)

Ig=rgb2gray(Ic);
figure(2);imshow(Ig);title('grey image','fontsize',16);

size(Ig)

figure(2);hold on;

plot(100,200,'r+','markersize',20);
Ig(200,100)

Ir=imresize(Ig,[240 300]);
figure(3);imshow(Ir);
title('Resized Image','fontsize',16);
axis on;
size(Ir)