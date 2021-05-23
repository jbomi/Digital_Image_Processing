function moving_filter(img)
originalRGB=imread(img);
%figure(1);subplot(1,3,1);imshow(originalRGB);title('Origin');
figure(1);subplot(1,2,1);imshow(originalRGB);title('Origin');

s=size(originalRGB)

h=fspecial('motion',100,100); %filter
%figure(2);imshow(h);

filterRGB=imfilter(originalRGB,h);  
%figure(1);subplot(1,3,2);imshow(filterRGB);title('fspecials');
figure(1);subplot(1,2,2);imshow(filterRGB);title('fspecials');

%boundaryReplicateRGB = imfilter(originalRGB, h, 'replicate');
%figure(1);subplot(1,3,3);imshow(boundaryReplicateRGB);title('boundaryReplicate');
end