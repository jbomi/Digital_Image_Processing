f = imread('circuit.png'); % 영상 불러오기
f = rgb2gray(f);
[M,N] = size(f);
P = 2*M;
Q = 2*N;
figure(1); subplot(3,3,1);imshow(f);title('original image');

% 2.
f2 = zeros(P,Q); 
for i = 1:P
    for j = 1:Q
        if i <= M && j<= N
            f2(i,j) = f(i,j);
        else
            f2(i,j) = 0;
        end
    end
end
% f2(1:M, 1:N) = f; 가능
subplot(3,3,2);imshow(uint8(f2));title('Padded image (f_p)');

% 3. 
Im = zeros(P,Q);
for i = 1:P
    for j = 1:Q
        Im(i,j) = f2(i,j).*(-1).^(i + j);
    end
end
subplot(3,3,3); imshow(uint8(Im));title('Multiplying by (-1)^x^+^y');

% 4.
ImFft = fft2(Im); 
subplot(3,3,4);imagesc(log(1+abs(ImFft))); % 밝게 보려고 log화 하기
colormap gray; title('F_p'); axis image;

% 5.
% making an ideal LPF
u=0:(P-1); u=u-P/2;
v=0:(Q-1); v=v-Q/2; 
[V, U]=meshgrid(v,u); 
D=sqrt(U.^2+V.^2); %
P=50;
H=double(D<=P); % ideal LPF
subplot(3,3,5);imagesc(H);title('H: centered LPF'); colormap gray; axis image;

G = ImFft.*H;
magG = abs(G);
subplot(3,3,6); imagesc(log(1+magG)); title('H*Fp'); colormap gray, axis image;

gin=real(ifft2(double(ifftshift(G))));
subplot(3,3,7); imshow(uint8(gin)); title('g_p');
 
out = zeros(M,N);
for i = 1:M
    for j = 1:N
        out(i,j) = gin(i,j);
    end
end
%out = gin(1:M, 1:N); 가능
subplot(3,3,8); imshow(uint8(out)); title('Final cropping 1st MXN'); axis image; 