%Term Project : Bicubic interpolation
%학번 : 21812009, 이름 : 조은영

function outputimage = myResizeBic(inputimage,scalefactor)
[r,c,k] = size(inputimage);

out_r = round(scalefactor*r); 
our_c = round(scalefactor*c); 
outputimage = zeros(out_r,our_c,k);

J = padding(inputimage); 
J = cast(J,'double');

for i = 1:out_r
    x1=floor(i/scalefactor);
    for j = 1:our_c
        y1=floor(j/scalefactor);
        for k=1:3
            M1 = floor(scalefactor*(x1-1)); 
            M2 = floor(scalefactor*(x1));
            M3 = floor(scalefactor*(x1+1)); 
            M4 = floor(scalefactor*(x1+2));
            A=[M1,M2,M3,M4];
            
            I1 = floor(scalefactor*(y1-1)); 
            I2 = floor(scalefactor*(y1));
            I3 = floor(scalefactor*(y1+1)); 
            I4 = floor(scalefactor*(y1+2));
            B=[I1,I2,I3,I4];
            
            S1 = J(x1+1,y1+1:y1+4,k);
            S2 = J(x1+2,y1+1:y1+4,k);
            S3 = J(x1+3,y1+1:y1+4,k);
            S4 = J(x1+4,y1+1:y1+4,k);
            
            yint1=Newtint(B,S1,j);
            yint2=Newtint(B,S2,j);
            yint3=Newtint(B,S3,j);
            yint4=Newtint(B,S4,j);
            yint=[yint1,yint2,yint3,yint4];
           
            outputimage(i,j,k)=Newtint(A,yint,i); 
        end
    end
end
outputimage = cast(outputimage,'uint8');
end