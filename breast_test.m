% image read
I=imread('breast.tif');
figure(1);
subplot(1,2,1);imshow(I);title('Original image');

% apply inversion function (intensity transformation): S=(L-1)-r
tic
S=255-I;
subplot(1,2,2);imshow(S);title('inversion image');
toc

% C-style coding
tic
[H W]=size(I)
O=zeros(H,W);
for i=1:H
    for j=1:W
        O(i,j)=255-I(i,j);
    end
end
figure(2); imshow(uint8(O)); title('output image: C-style');
toc        