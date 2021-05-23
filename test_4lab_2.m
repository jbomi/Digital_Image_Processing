im=imread('hw.jpg');
figure(1);subplot(1,3,1);imshow(I);title('Original Image','fontsize',13);

n=randn(size(I))*20;
In=uint8(double(I)+n);
figure(1);subplot(1,3,2);imshow(In);title('Noisy Image','fontsize',13);

w=zeros(5,5)/25;
[m n]=size(w);
crr=csum(w*In);
wsum=cusum(w);
g=crr/wsum;
result=g(1+im);
figure(1);subplot(1,3,3);imagesc(result);title('myimfilter','fontsize',13);



                                                                            