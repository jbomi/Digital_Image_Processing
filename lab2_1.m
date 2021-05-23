I=imread('[크기변환]woman.png');
figure(1);
imshow(I);axis on;
title({'input image';'21811957 정보미'}','fontsize',14);
tic
Inn=imresize(I,4,'nearest');
Ibil=imresize(I,4,'bilinear');
Ibic=imresize(I,4,'bicubic');
toc
figure(2);
subplot(1,3,1);imshow(Inn);title({'Resizing using NN';'21811957 정보미'},'fontsize',14);axis on;
subplot(1,3,2);imshow(Ibil);title({'Resizing using Bilinear';'21811957 정보미'},'fontsize',14);axis on;
subplot(1,3,3);imshow(Ibic);title({'Resizing using Bicubic';'21811957 정보미'},'fontsize',14);axis on;
