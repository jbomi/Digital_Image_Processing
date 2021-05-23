% Pseudo coloring
close('all');
I=imread('bone.bmp');
Igray=rgb2gray(I);
figure(1);imshow(Igray);cmap=colormap('gray');colorbar % colormap gray(256)
figure(2);imshow(Igray);colormap jet;colorbar

% my own colormap
mycmap=[0 0 0
    1 0 0
    0 1 0
    0 1 1
    1 1 1];
figure(3);imshow(Igray);colormap(mycmap);colorbar