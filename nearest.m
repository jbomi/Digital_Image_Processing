A=imread('rice.png');

% DEFINE THE RESAMPLE SIZE
Col = 512;
Row = 512;


%FIND THE RATIO OF THE NEW SIZE BY OLD SIZE
rtR = Row/size(A,1);
rtC = Col/size(A,2);



%OBTAIN THE INTERPOLATED POSITIONS
IR = ceil([1:(size(A,1)*rtR)]./(rtR));
IC = ceil([1:(size(A,2)*rtC)]./(rtC));


%ROW_WISE INTERPOLATION
B = A(:,IR);


%COLUMN-WISE INTERPOLATION
B = B(IC,:);



figure,subplot(121),imshow(A);title('BEFORE INTERPOLATION'); axis([0,512,0,512]);axis on;

subplot(122),imshow(B);title('AFTER INTERPOLATION');  axis([0,512,0,512]);axis on;
