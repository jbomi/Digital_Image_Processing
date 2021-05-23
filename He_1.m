I=imread('dark.tif');
figure(1);subplot(2,2,1);imshow(I);title('original');
[count center]=hist(double(I(:)),0:255);
subplot(2,2,2);bar(center,count);title('histogram');

I=imread('light.tif');
figure(1);subplot(2,2,3);imshow(I);title('original');
[count center]=hist(double(I(:)),0:255);
subplot(2,2,4);bar(center,count);title('histogram');