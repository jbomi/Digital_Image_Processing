% load an image
I=imread('zone-plate.png');
figure(1);imshow(I);truesize;title('origin');

% subsampling: direct resizing
samplingInterval=1;
[H W]=size(I);
Ir=[];
for i=1:samplingInterval:H
    for j=1:samplingInterval:W
        Ir(floor(i/samplingInterval)+1,floor(j/samplingInterval)+1)=I(i,j);
    end
end
figure(2);imagesc(Ir);colormap gray;truesize;title('sampled');
 
% subsampling: resizing after smoothing (band-limited image)
g=fspecial('gaussian',11,1); % gaussian kernel
I=imfilter(I,g,'same','replicate');

Ir=[];
for i=1:samplingInterval:H
    for j=1:samplingInterval:W
        Ir(floor(i/samplingInterval)+1,floor(j/samplingInterval)+1)=I(i,j);
    end
end
figure(3);imagesc(Ir);colormap gray;truesize;title('sampled after smoothing');

