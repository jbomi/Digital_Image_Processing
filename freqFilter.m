% 1. �̹��� ������ ������ 2M, 2N �� ã��
I = imread('me.jpg'); % �̹��� �ҷ�����
I = rgb2gray(I); % ���ȭ
I = im2double(I); % ����, �����ϸ�
[m,n] = size(I); % �� ������ ������ ����
I2 = zeros(2*m,2*n); % �� ���� 2���� ���� �Ҵ�

% 2. Form padded image 0ä��� 
[p,q] = size(I2);
% for�� ������ ������ �ְ� ������ 0���� ä���
for i = 1:p
    for j = 1:q
        if i <= m && j<= n
            I2(i,j) = I(i,j);
        else
            I2(i,j) = 0;
        end
    end
end

figure(1); subplot(3,3,1);imshow(I);title('original image');

subplot(3,3,2);imshow(I2);title('Padded image (fp)');
Im = zeros(p,q);
% 3. Multiplying the padded image with (-1)^(x+y)
% �е��� �̹����� (-1)^(x+y) ���ϱ� center its transform
for i = 1:p
    for j = 1:q
        Im(i,j) = I2(i,j).*(-1).^(i + j);
    end
end
subplot(3,3,3);
imshow(Im);title('Multiplying by (-1)x+y');

% 4. DFT image �̹����� ǻ���� �Ѵ�.
ImFft = fft2(Im); % multiplying �� �̹����� ǻ�����Ѵ�.
subplot(3,3,4);imagesc(log(1+abs(ImFft))); % ��� ������ logȭ �ϱ�
colormap gray; title('Fp');

% 5. H ���� ����� // Generate a real, symmetric filter func
H = fspecial('gaussian',[1410 1314],50); %fspecial func���� ����þ� ���͸� ����.
% �̹��� ũ�⸦ 2�� �е��� �̹��� ������� �����.
% �л갪�� ���� output ��� �̹����� �޶�����.

subplot(3,3,5);imagesc(abs(H));title('H: centered LPF'); % �̹��� �Ѹ��ϴ�.

% 6. H ���Ϳ� ǻ���� �� �̹����� ���Ѵ�. G = H.*F
G = ImFft.*H;
subplot(3,3,6);
imshow(G);title('HFp');

% 7. Obtain the processed image / ó���� �̹��� ���.
gin = real(ifft2(G)); % �Ǽ��κ��� inverse fourier transform �Ѵ�
%subplot(3,3,7);
%imagesc(g); colormap gray;
%title('gp');

% �Ǽ��κ��� inverse ǻ�������� multiply �߾��� �͵� �ǵ�����.
% for������ .*((-1).^(i+j)) �����ش�
g = zeros(p,q);
for i = 1:p
    for j = 1:q
        g(i,j) = gin(i,j).*((-1).^(i+j));
    end
end
subplot(3,3,7);
imagesc(g);title('gp');

% 8. ó�� 2��� �е��� ������ �ٽ� ������
% ���� ũ���� �̹����� ��´�.
out = zeros(m,n);
for i = 1:m
    for j = 1:n
        out(i,j) = g(i,j);
    end
end
subplot(3,3,8);
imagesc(out);title('output image'); truesize; axis image;

figure(2); subplot(1,3,1); imshow(I); title('input');
subplot(1,3,2); imagesc(abs(H)); axis image; title('H-filter');
subplot(1,3,3); imagesc(out); axis image; title('output');

figure(3); subplot(1,3,1); imshow(I); title('input');
subplot(1,3,2); imshow(G);  title('G(u,v)=HF');
subplot(1,3,3); imagesc(out); axis image; title('output, g(x,y)');
