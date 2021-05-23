% 21811957 정보미
I=imread('me.jpg');
I=rgb2gray(I);
figure(1);imshow(I);title('input image');axis on;truesize
[M N D]=size(I);
P=2*M;Q=2*N;
pd=padarray(I,[M,N],'post');
[pM pN]=size(pd);
figure(2);imshow(pd);title('Filtered Image');axis on; truesize;

center=zeros(P,Q);
for i = 1:P
    for j = 1:Q
        center(i,j) = pd(i,j).*(-1).^(i + j);
    end
end
figure(3);imshow(uint8(center));title('Multiplying');

ft=fft2(center);
figure(4);imagesc(log(1+abs(ft)));colormap gray; title('F_p'); axis image;

u=0:(P-1); u=u-P/2;v=0:(Q-1); v=v-Q/2; 
[V, U]=meshgrid(v,u); 
D=sqrt(U.^2+V.^2); 
P=50;
H=double(D<=P); 
figure(5);imagesc(H);title('H: centered LPF'); colormap gray; axis image;

G = ft.*H;
magG = abs(G);
figure(6); imagesc(log(1+magG)); title('H*Fp'); colormap gray, axis image;

gin=real(ifft2(double(ifftshift(G))));
figure(7); imshow(uint8(gin));

out = zeros(M,N);
for i = 1:M
    for j = 1:N
        out(i,j) = gin(i,j);
    end
end
figure(8); imshow(uint8(out)); title('Final cropping 1st MXN'); axis image; 
