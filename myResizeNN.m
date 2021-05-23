% Nearest Neighbor Interpolation
function output = myResizeNN(input, scale)
% original Image size
ORSize = size(input,1);
OCSize = size(input,2);
% new image size
NRSize = floor(ORSize * scale);
NCSize = floor(OCSize * scale);
% Since each row and column applies equally, We just make a matrix without using the meshgrid function.
% To avoid error about refering non assigned memory, round function to floor function
R = floor([0:NRSize - 1]./(scale));
C = floor([0:NCSize - 1]./(scale));
% zerobased to onebased
% nearest neighbor Interpolation using R, C Matrix
temp = input(R + 1,:,:);
temp = temp(:,C + 1,:);
output= uint8(temp);
end
