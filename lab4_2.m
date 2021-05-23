% This is a spacial low pass filter (smoothening)
% Usage:
% output = myfilter(in_image,N)
% inputs :
% I : input gray scale image
% n = mask size (should be odd int)
% option : determining output size. (same, full)

function output_image=myfilter(I,n,option)

% check if image is grayscale
if (length(size(I)) > 2 )
   error('The image should be gray-scale'); %흑백영상만 함수 실행 가능하게 하기 위해
end

mask=ones(n); %kernel 생성
marg=floor((n-1)/2); %일반적으로 padding할 때 nxn 필터로 한다면 필터 크기의 반을 floor 처리한 값으로 영상주변을 padding함.

[rows, cols]=size(I);

output=zeros(rows+(2*marg), cols+(2*marg)); %zero padding

for i=1+marg:rows-marg
   for j=1+marg:cols-marg
       output(i,j)=I(i-marg, j-marg);
   end
end

norm=sum(sum(mask)); %분모에 들어갈 것 (normalization을 위해 사용되는 값)

for i=1+marg:rows-marg
   for j=1+marg:cols-marg
      block=output(i-marg:i+marg,j-marg:j+marg); %특정 픽셀에 대해 mask를 적용할 때, mask 아래의 원본 영상 픽셀 값 추출
      output(i,j)=sum(sum(block.*mask))/norm; %7주차 강의자료 p.16에 있는 식을 구현한 코드
   end
end

switch (option)
    case 'full'
        output_image=uint8(output);
    case 'same'
        output_image=output(1+marg:rows-marg, 1+marg:cols-marg);
        output_image=uint8(output_image);
end
end