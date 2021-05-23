% load an image
I=imread('dark.tif'); 
figure(1); subplot(1,2,1); imshow(I); title('input original');

% extract histogram
[count center]=hist(double(I(:)),0:255);
[H W]=size(I);
figure(1);subplot(1,2,2); bar(center,count/(H*W)); title('input histogram');
xlabel('r'); ylabel('p_r(r)');

% apply histogram equalizer
 ieq=histeq(I,256);
 figure(2); subplot(1,2,1); imshow(ieq); title('input equalized');

[count center]=hist(double(ieq(:)),0:255);
[H W]=size(ieq);
figure(2);subplot(1,2,2); bar(center,count/(H*W)); title('output histogram');
xlabel('s'); ylabel('p_s(s)');
