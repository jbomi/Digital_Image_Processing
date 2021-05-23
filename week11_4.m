% load input image
f=imread('testPlate.tif');
figure(1);subplot(2,2,1);imshow(f);title('input');

% 2D FFT
F=fft2(double(f));
F=fftshift(F);
magF=abs(F);
figure(1);subplot(2,2,2);imagesc(log(1+magF));title('freq domain');colormap gray;axis image;