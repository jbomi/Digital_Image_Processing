% load an image 
I=imread('face.png');
figure(1);imshow(I);
xlabel('x','fontsize',13);ylabel('y','fontsize',13);
axis on;

% image --> freq :주파수 변환
F=fft2(I);
absF=abs(F); % 크기 뽑는 방법
figure(2);imagesc(absF);colormap gray; colorbar

% shift freq to center image in freq domain
centerF=fftshift(F);
absCenterF=abs(centerF);
figure(3); imagesc(absCenterF);colormap gray; colorbar;
xlabel('u','fontsize',13);ylabel('v','fontsize',13);

% intensity tr
logF=log(1+absCenterF);
figure(4); imagesc(logF);colormap gray; colorbar;

% phase
phase=angle(double(centerF));
figure(5);imagesc(phase);colormap gray;colorbar;