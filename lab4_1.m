I=imread('pattern.tif');
figure(1);subplot(1,3,1);imshow(I);title('Original Image','fontsize',13);
Ist=[];
% add Gaussian noidse
n=randn(size(I))*20;
In=uint8(double(I)+n);
%figure(1);subplot(1,3,2);imshow(In);title('only noisy','fontsize',13);
%lst=find(In<0);In(Ist)=0;
%figure(2);subplot(1,2,1);imshow(In);title('when find In<0','fontsize',13);
%Ist=find(In>255);In(Ist)=255;
%figure(2);subplot(1,2,2);imshow(In);title('when find In>255','fontsize',13);
figure(1);subplot(1,3,2);imshow(In);title('Noisy Image','fontsize',13);

% averaging filter
w=ones(5,5)/25;
Ir=imfilter(In,w,'same','replicate');
figure(1);subplot(1,3,3);imshow(Ir);title('Average Image','fontsize',13);
