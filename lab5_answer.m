Ig = imread('face.png');
Ig = rgb2gray(Ig);
F = fft2(double(Ig));
Phase = angle(double(F));
Recon_Phase = ifft2(exp(1i*angle(F)));
centerF = fftshift(F);
Mag=abs(centerF);
I2 = imread('rectangle.tif');
rec = imresize(I2, size(Ig));
R = fft2(rec);
R_Mag=abs(R);
MyPh_RecSpe=ifft2(exp(1i.*angle(F)).*R_Mag);
RecPh_MySpe=ifft2(exp(1i.*angle(R)).*abs(F));
figure(1);subplot(2,3,1);imshow(Ig);title('Origin Input');
subplot(2,3,2);imagesc(Phase);title('Phase');colormap gray; axis image;
subplot(2,3,3);imagesc(real(Recon_Phase));title('Phase based recon');colormap gray;axis image;
subplot(2,3,4);imagesc(log(1+Mag));title('Spectrum based recon');colormap gray;axis image;
subplot(2,3,5);imagesc(real(MyPh_RecSpe));title('Recon by phase + rect spectrum');colormap gray;axis image;
subplot(2,3,6);imagesc(real(RecPh_MySpe));title('Recon by Rec phase + origin spectrum');colormap gray;axis image;


