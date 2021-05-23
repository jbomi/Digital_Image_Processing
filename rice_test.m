% load an image
I=imread('rice.png');
figure(1); imshow(I); title('input image');
Inn=imresize(I,1.4,'nearest');
Ibi=imresize(I,1.4,'bilinear');
Ibic=imresize(I,1.4,'bicubic');
figure(2)
subplot(1,3,1); imshow(Inn); title('Nearest neighbor');
subplot(1,3,2); imshow(Ibi); title('Bilinear');
subplot(1,3,3); imshow(Ibic); title('Bicubic');
truesize
