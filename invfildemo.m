% demonstration of inverse filter, wiener filters, and 
% constrained least square filtering

clear all

% load image 
f=double(imread('matlabImage.jpg')); % double 로 바로 변환
% create (-1)^(x+y) mask
[m,n]=size(f); % image sizes
mn=m*n;
tmp=[1:m]'*ones(1,n)+ones(m,1)*[1:n]; % input image modulation center shift
tmp=1-2*rem(tmp,2); % 나눗셈의 나머지, a를 b로 나눈 후 나머지를 반환합니다.
Ff=fft2(f.*tmp); % 2d FFT of f
% note that fft2.m does not divid the result by mn, but ifft2.m does.

% create blurring mask
h=motionblur(45,21); % direction: 45degree, window size: 9 x 9 window of 45 degree motion blur
h=h/sum(sum(h));  % scale h so that its elements add to 1, normalize
Hh=fft2(h.*tmp(1:size(h,1),1:size(h,2)),m,n); % append h to 64 by 64 and take 2d FFT

% generate noise
% psnr = 20*log_10 256/sigma
% hence sigma = 256*10^(-psnr/20)
psnr0=input('Peak-to-peak signal to noise ratio (PSNR, default = 80db) = ');
if isempty(psnr0), psnr0=80; end
sigma=255*10^(-psnr0/20);
noise=randn(m,n)*sigma;  % gaussian noise with psnr = 30 dB

Gg0=Ff.*Hh;   % Fourier transform of the noiseless blurred image
g=round(abs(ifft2(Gg0).*tmp)+noise); % blurred image + noise

% calculate RMS error per pixel
erms=sqrt(sum(sum(abs(g-f).^2))/mn);
psnr=20*log10(255/erms);
disp(['RMS error per pixel = ' num2str(erms)]);
disp(['Calculated PSNR = ' num2str(psnr) ' dB']);

figure(1),clf
subplot(221),imagesc(f),title({'21811957 정보미';'original, f'}),colormap('gray')
subplot(222),imagesc(g),title('degraded, g'),colormap('gray')

disp('original and degraded images, ')
disp('Next, compare inverse filter and Wiener filter, ')
disp('press any key to continue ...')
pause

Gg=fft2(g); % FFT of blurred+noise image

% Inverse filtering
Ffinv=Gg./([abs(Hh)<1e-3].*1e-3+Hh);
finv=abs(ifft2(Ffinv));

% Wiener filtering
K=sigma;
H2=abs(Hh).^2; 
Ffwin=H2.*Gg./((H2+K).*Hh);
fwin=abs(ifft2(Ffwin));
figure(1),
subplot(223),imagesc(finv),title('Inverse'),colormap('gray')
subplot(224),imagesc(fwin),
title(['Wiener, K=' num2str(K) ]),colormap('gray')

disp(['Inverse filter and Wiener filter results displayed, K = ' num2str(K)])
disp('Now, you have a chance to experiment with different values of K ...')
otherK=input('Enter 1 to try other values of K, other key to skip: ');
if isempty(otherK), otherK=0; end
while otherK==1, %
   K=input('Enter a positive value for noise variance: ')
   Ffwin=H2.*Gg./((H2+K).*Hh);
   fwin=abs(ifft2(Ffwin));
   subplot(224),imagesc(fwin),title(['Wiener, K=' num2str(K) ]),colormap('gray')
   otherK=input('Enter 1 to try other values of K,  other key to skip: ');
end

disp('Press any key to demonstrate constraint least square filters ...')
pause

figure(2),clf
% Constrained least square method using smoothing operator
% p(x,y) = [0  -1   0]
%          [-1  4  -1]
%          [ 0 -1   0]
gamma=.001;
p=[0 -1 0; -1 4 -1; 0 -1 0];
Pp=fft2(p.*tmp(1:size(p,1),1:size(p,2)),m,n);
Hhcls=conj(Hh).*Gg./(H2+gamma*abs(Pp).^2);
hcls=abs(ifft2(Hhcls));
figure(2),subplot(235),imagesc(hcls),title(['CLS, gamma=' num2str(gamma)])
colormap('gray')

disp(['Initial result of CLS filter using gamma = ' num2str(gamma)])

% now start iteration
eta2=mn*sigma^2;  % (5.9-12), m_eta = 0 in this example
disp(['||eta||^2 = ' num2str(eta2)])
icnt=0; cntmax=20;
converge=0; 
accuracy=mn*sigma;  % accuracy factor a in (5.9-8), every pixel within sigma
gub=10; glb=0; % upper and lower bounds of gamma initially
while converge==0, % start iteration
   icnt=icnt+1; disp(['iteration # ' int2str(icnt)]);
   % Use Parsevel theorem, ||r||^2 = sum sum |R|^2
   Rr=abs(Gg-Hh.*Hhcls);
   r2=(sum(sum(abs(Rr).^2))-Rr(1,1)^2)/mn;  % remove the mean value
   disp(['||r||^2 = ' num2str(r2) ', ||eta||^2 = ' num2str(eta2)])
   if abs(r2-eta2)<accuracy, converge=1;  %done, do nothing
   else
      if r2 < eta2, % gamma too small
         if gamma > glb, glb=gamma; end % update lower bound
         % gamma=gamma*(1+0.9^icnt); disp(['gamma increased to: ' num2str(gamma)]);
      elseif r2 > eta2, % gamma too large
         if gamma < gub, gub=gamma; end % update upper bound
         % gamma=gamma*(1-0.9^icnt); disp(['gamma decreased to: ' num2str(gamma)]);
      end
      gamma=0.5*(gub+glb);  % use bisection search
      Hhcls=conj(Hh).*Gg./(H2+gamma*abs(Pp).^2);
      hcls=abs(ifft2(Hhcls));
      if rem(icnt-1,3)==0, % plot 1, 4, 7, 10, 13 iterations
        figure(2),
        eval(['subplot(23' int2str(ceil(icnt/3)) '),'])
        imagesc(hcls),title(['iteration ' int2str(icnt) ', gamma=' num2str(gamma)])
        colormap('gray')
        disp(['gamma = ' num2str(gamma) ', enter any key to continue ...'])
      end
      pause
      if icnt == cntmax, 
         converge=1; disp('Reach max. iteration count, stop!')
      end
   end % if abs(... loop
end % while loop
figure(2),
subplot(236),
imagesc(hcls),title(['iteration ' int2str(icnt) ', gamma=' num2str(gamma)])
colormap('gray')
   

   

