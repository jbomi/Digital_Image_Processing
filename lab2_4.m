BW = logical ([1 1 1 0 0 0 0 0
1 1 1 0 1 1 0 0
1 1 1 0 1 1 0 0
1 1 1 0 0 0 1 0
1 1 1 0 0 0 1 0
1 1 1 0 0 0 1 0
1 1 1 0 0 1 1 0
1 1 1 0 0 0 0 0]);
L = bwlabel(BW,8)
L = bwlabel(BW,4)
figure(10); subplot(1,2,1); imagesc(BW); colorbar;
title('21811957 정보미')
subplot(1,2,2); imagesc(L); colormap jet; colorbar;
title('21811957 정보미')

[r, c] = find(L==2);
rc = [r c]



