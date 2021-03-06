% load input image
f=imread('testPlate.tif');
figure(1);subplot(2,2,1);imshow(f);title('input');

% 2D FFT
F=fft2(double(f));
F=fftshift(F);
magF=abs(F);
figure(1);subplot(2,2,2);imagesc(log(1+magF));title('freq domain');colormap gray;axis image;

% making an ideal LPF
[M,N]=size(f);
u=0:(M-1);u=u-M/2;
v=0:(N-1);v=v-N/2;
[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);figure,imagesc(D);colormap gray;
P=50; % cut-off freq (radius)
H=double(D<=P); % idal LPF
figure(1);subplot(2,2,3);imagesc(H);title('ILPF');colormap gray;axis image;
h=real(ifft2(double(ifftshift(H))));
figure(5);imagesc(fftshift(h));title('spatial representation of ILPF');colormap gray;
axis image;

% filtering in freq. domain
G=H.*F;
magF=abs(G);
figure(1);subplot(2,2,4);imagesc(log(1+magF));title('HF');colormap gray;axis image;

% inverse FFT2
g=real(ifft2(double(ifftshift(G))));
figure(2);imshow(uint8(g));title('inverse FFT2');


