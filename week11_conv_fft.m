% filtering in space: convolution using periodicity
I=imread('pattern.tif');
figure(1);imshow(I);title('input');axis on;truesize
h=ones(11,11)/(11*11); % blurring
If=imfilter(I,h,'circular','full'); % padded by ciruluar, 0
figure(2);imshow(If);title('filterd');axis on;truesize

% frequency component
I=imread('triangle2.png');
I=rgb2gray(I);
figure(3);imshow(I);

F=fft2(I);
Fs=fftshift(F);
magF=abs(Fs);
phase=angle(Fs);
figure(4);imagesc(log(1+magF));colormap gray;
figure(5);imagesc(phase);colormap gray;