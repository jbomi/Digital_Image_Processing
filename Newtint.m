%Term Project : Bicubic interpolation2 - Newtint
%학번 : 21812009, 이름 : 조은영

function yint=Newtint(a,b,c) % Newton Rhapson Interpolation
n=length(a);
d=zeros(n,n);
d(:,1)=b(:);

for j=2:n
    for i=1:n-j+1
        d(i,j)=(d(i+1,j-1)-d(i,j-1))/(a(i+j-1)-a(i));
    end
end

g=1;
f=d(1,1);

for j=2:n
    g=g*(c-a(j-1));
    f=f+d(1,j)*g;
end

yint=f;
end


