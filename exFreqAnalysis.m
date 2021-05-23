% filtering in space: Convolution using periodicity
I=imread('pattern.tif');
figure(1);imshow(I);title('input image');axis on;truesize
h=ones(11,11)/(11*11); % moving average filter
If=imfilter(I,h,'circular','full'); % padded by circular(위아래로 이미지가 반복되는 것) , 0
figure(2);imshow(If);title('Filtered Image');axis on; truesize;

% Frequency component
I=imread('triangle2.png');
I=rgb2gray(I);
figure(3);imshow(I);

F=fft2(I);
Fs=fftshift(F);
magF=abs(Fs);
figure(4);imagesc(log(1+magF));colormap gray;