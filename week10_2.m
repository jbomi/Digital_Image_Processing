% load an image
I=imread('zone-plate.png');
figure(1);imshow(I);truesize;title('Original Zone-Plate Image');

% subsampling: direct resizing
samplingInterval=2;
[H W]=size(I);
Ir=[];
for i=1:samplingInterval:H
    for j=1:samplingInterval:W
        Ir(floor(i/samplingInterval)+1,floor(j/samplingInterval)+1)=I(i,j);
    end
end 
figure(2);imagesc(Ir);colormap gray;truesize;title('Sampled Zone-Plate');

% subsampling :resizing after smoothing (band-limited image)
g=fspecial('gaussian',11,1); % gaussian kernel
I=imfilter(I,g,'same','replicate');
Ir=[];
for i=1:samplingInterval:H
    for j=1:samplingInterval:W
        Ir(floor(i/samplingInterval)+1,floor(j/samplingInterval)+1)=I(i,j);
    end
end   
figure(3);imagesc(Ir);colormap gray;truesize;title('Sampled Zone-Plate Image after smoothing');
