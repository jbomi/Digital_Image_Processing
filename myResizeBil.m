function output = myResizeBil(input, scale)
% Size
ORSize = size(input,1);
OCSize = size(input,2);
NRSize = floor(ORSize * scale);
NCSize = floor(OCSize * scale);
% initialize output variable
output = uint8(zeros(NRSize, NCSize, size(input,3)));
RScale = (ORSize - 1) / NRSize;
CScale = (OCSize - 1) / NCSize;
[Cf,Rf] = meshgrid(0 : NCSize - 1,0 : NRSize - 1);
% scaling Row and colum point
Rf = Rf .* RScale;
Cf = Cf .* CScale;
R = floor(Rf);
C = floor(Cf);
% differences between floor point and scailed point
dR = Rf - R;
dC = Cf - C;
% return coordinates zerobased to onebased indexing number with row and column vectors
R=R+1;C=C+1;
RC = sub2ind([ORSize,OCSize],R,C);
RRC = sub2ind([ORSize,OCSize],R+1,C);
RCC = sub2ind([ORSize,OCSize],R,C+1);
RRCC= sub2ind([ORSize,OCSize],R+1,C+1);
%do repeat tasks each R, G, B
for RGB = 1:size(input,3)
 % using index
 % input array is image, so we have to cast it to the doubletype
 oriVal = double(input(:,:,RGB));
 % bilinear Interpolation
 temp = oriVal(RC).*(1 - dR).*(1 - dC) + oriVal(RRC).*(dR).*(1- dC) + oriVal(RCC).*(1 - dR).*(dC) + oriVal(RRCC).*(dR).*(dC);
 output(:,:,RGB) = uint8(temp);
end