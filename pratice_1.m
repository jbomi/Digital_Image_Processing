% load image
Ic=imread('test.jpg');
figure(1); %make a figure
imshow(Ic); %display image data on the figure
title('Color Image','fontsize',16);%attach a figure title
size(Ic) %image size information
% M x N x 3

Ig=rgb2gray(Ic); % color to gray transform
figure(2);
imshow(Ig);
title('Gray Image','fontsize',16)
size(Ig)
% M x N 

% check image value
figure(2); hold on;

plot(100,200,'r+','markersize',30);
axis on;
% column index, row index

Ig(200,100) % intensity(밝기) at row index column index

% Resolution
Ir=imresize(Ig,[240 320]); % resize
figure(3); imshow(Ir);
title('Resized Image','fontsize',16);
axis on;
size(Ir)

% Bit resolution
nbit=2; %number of used bits
Ib=round(double(Ir)/(256/2^(nbit))); %quantize image levels
Ib2=uint8(Ib*2^(8-nbit)); % stretch to 0-255 intensity levels
figure(4); imshow(Ib2); 
title('Reduced Gray level','fontsize',16);


