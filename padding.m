%Term Project : Bicubic interpolation2 - padding
%학번 : 21812009, 이름 : 조은영

function J=padding(inputimage)
[r,c,k] = size(inputimage);

J = zeros(r+4,c+4,k);

J(3:r+2,3:c+2,:) = inputimage; 
J(3:r+2,2,:)=inputimage(:,1,:);
J(3:r+2,c+3,:)=inputimage(:,c,:);

J(2,3:c+2,:)=inputimage(1,:,:);
J(r+3,3:c+2,:)=inputimage(r,:,:);

J(3:r+2,1,:)=inputimage(:,1,:);
J(3:r+2,c+4,:)=inputimage(:,c,:);

J(1,3:c+2,:)=inputimage(1,:,:);
J(r+4,3:c+2,:)=inputimage(r,:,:);

J(2,2)=inputimage(1,1);J(2,c+3)=inputimage(1,c);
J(r+3,2)=inputimage(r,1);J(r+3,c+3)=inputimage(r,c);
end
