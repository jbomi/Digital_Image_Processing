% read a reference image
I1=imread('pout.tif');
subplot(3,2,1); imshow(I1); title('ref. image');
subplot(3,2,2); imhist(I1); title('histogram of ref');

% read a test image
I2=imread('tire.tif');
subplot(3,2,3); imshow(I2); title('input image');
subplot(3,2,4); imhist(I2); title('histogram of input');

% run the histogram match
Ihm=imhistmatch(I2,I1,256);
subplot(3,2,5); imshow(Ihm); title('matched image');
subplot(3,2,6); imhist(Ihm); title('histogram of matched');


