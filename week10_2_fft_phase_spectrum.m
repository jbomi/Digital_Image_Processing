% load an image
I=imread('rectangle.tif');
figure(1);imshow(I);xlabel('x');ylabel('y');
axis on

% image--> freq
F=fft2(I);
absF=abs(F);
figure(2);imagesc(absF);colormap gray;colorbar

% shift freq to center image in freq domain
centerF=fftshift(F);
absCenterF=abs(centerF);
figure(3);imagesc(absCenterF);colormap gray;colorbar
xlabel('u');ylabel('v');

% intensity tr
logF=log(1+absCenterF);
figure(4);imagesc(logF);colormap gray;colorbar
% 실제 보이는 거랑 물리적인 값이랑 같지 않음

% phase: 공간적 shift 
phase=angle(double(centerF));
figure(5);imagesc(phase);colormap gray; % linear하게 phase 변함


