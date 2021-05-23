% load an image 
I=imread('me.jpg');
I=rgb2gray(I);
figure(1);subplot(2,3,1);imshow(I);title({'21811957';'정보미'})

F=fft2(double(I)); % image --> freq :주파수 변환
phase=angle(F); % Input Image phase
figure(1);subplot(2,3,2);imagesc(phase);title('Phase');

Phase_Recon = ifft2(exp(1i*phase)); % Input Image inverse fourier transform => reconstruction
figure(1);subplot(2,3,3);imagesc(Phase_Recon);colormap gray;title('Phase based reconstruction'); 

centerF=fftshift(F); % freq shift to center
absCenter=abs(centerF); % center freq spectrum
logF=log(1+absCenter); % strengthen high freq
figure(1);subplot(2,3,4);imagesc(logF);title('spectrum based reconstruction'); 

r=imread('rectangle.tif');
rer=imresize(r,size(I)); % rectangle image resize to size of input image
rerF=fft2(double(rer)); % img -> freq
rerphase=angle(rerF); % rectangle phase
rermag=abs(rerF); % rectangle spectrum

R_phase_rermag=ifft2(exp(1i.*phase).*rermag); % Reconstruction by woman phase + rectangle spectrum
R_rerphase_abs=ifft2(exp(1i.*rerphase).*abs(F)); % Reconstruction by rectangle phase + woman spectrum
figure(1);subplot(2,3,5);imagesc(R_phase_rermag);title({'Reconstruction by'; 'woman phase + rectangle spectrum'}); 
figure(1);subplot(2,3,6);imagesc(real(R_rerphase_abs));title({'Reconstruction by'; 'rectangle phase + woman spectrum'}); 





