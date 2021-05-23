I=imread('color.jpg');
fig1=figure(1);fig1.set('color','w');subplot(2,3,1);imshow(I);title('RGB input');

% Make an RGB color space
R=uint8(zeros(size(I)));R(:,:,1)=I(:,:,1);
subplot(2,3,2);imshow(R);title('Red');

G=uint8(zeros(size(I)));R(:,:,2)=I(:,:,2);
subplot(2,3,3);imshow(G);title('Green');

B=uint8(zeros(size(I)));R(:,:,3)=I(:,:,3);
subplot(2,3,4);imshow(B);title('blue');

% HSI color space
hsi=rgb2hsi(I);
%max(max(hsi(:,:,1)))
figure(2);subplot(1,3,1);
h=hsi(:,:,1);
s=hsi(:,:,2);
i=hsi(:,:,3);
subplot(1,3,1);
imagesc(h);colorbar;axis image;title('hue');
subplot(1,3,2);
imagesc(s);colorbar;axis image;title('saturation');
subplot(1,3,3);
imagesc(i);colorbar;axis image;title('intensity');

% RGB color cube
% define vertices
vm=[0 0 0;
    1 0 0;
    1 1 0;
    0 1 0;
    0 0 1;
    1 0 1;
    1 1 1;
    0 1 1
    ];

% make faces
fm=[1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
cdata=[0 0 0; % black
       1 0 0; % red
       1 0 1; % magenta
       0 0 1; % blue
       0 1 0; % green
       1 1 0; % yellow
       1 1 1; % white
       0 1 1; % cyan
       ]
figure
patch('Vertices',vm,'Faces',fm,'FaceVertexCdata',cdata,'FaceColor','interp');