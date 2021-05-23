L=255;
img=imread('light.tif');
img=rgb2gray(img);
h0=imhist(img,256);

Ih=histeq(img,256);
h1=imhist(Ih,256);

output=h0/numel(img);
Csum=cumsum(output);
myhist=Csum(img+1);
myhist=uint8(myhist*L);
h2=imhist(myhist,256);

figure(1);subplot(3,2,1);imshow(img);title('Original');
subplot(3,2,2);bar(h0);title('Origin hist');
subplot(3,2,3);imshow(Ih);title('matlab histeq');
subplot(3,2,4);bar(h1);title('matlab hist');
subplot(3,2,5);imshow(myhist);title('myhist');
subplot(3,2,6);bar(h2);title('myhist hist');
