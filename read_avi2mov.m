
readerobj = mmreader('foreman.avi', 'tag', 'myreader1');
vidFrames = read(readerobj);
numFrames = get(readerobj, 'numberOfFrames');
for k = 1 : numFrames
    mov(k).cdata = vidFrames(:,:,:,k);
    mov(k).colormap = [];
end
%movie(mov, 1, readerobj.FrameRate);

for i = 1:numFrames
R = mov(i).cdata(:,:,1);
G = mov(i).cdata(:,:,2);
B = mov(i).cdata(:,:,3);
movGray(i).cdata(:,:,1) = 0.2990*R + 0.5870*G + 0.1140*B;
movYCbCr(i).cdata = rgb2ycbcr(mov(i).cdata);
end

fid = fopen('foreman_Y.yuv','wb');
fid2 = fopen('foreman_G.yuv','wb');
for i = 1:numFrames
    aa = movYCbCr(i).cdata(:,:,1);
    bb = movGray(i).cdata(:,:,1);
    fwrite(fid,aa.');
    fwrite(fid2,bb.');
end
fclose(fid);
fclose(fid2);