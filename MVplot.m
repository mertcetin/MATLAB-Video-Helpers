function MVplot(width,height,blocksize,totalframecount,scale)

block_x = width / blocksize;
block_y = height/ blocksize;
framecount = totalframecount / 2 -1;
[X,Y] = meshgrid(1:block_x,1:block_y);

fidX = fopen('MV_X.txt','r');
MV_X = zeros(block_y,block_x,framecount);

fidY = fopen('MV_Y.txt','r');
MV_Y = zeros(block_y,block_x,framecount);

for frame=1:framecount
    for i=block_y:-1:1
        for j=1:1:block_x
            MV_X(i,j,frame) = fscanf(fidX,'%g', 1);
            MV_Y(i,j,frame) = -fscanf(fidY,'%g', 1);
        end
    end
    quiver(X,Y,MV_X(:,:,frame)/blocksize,MV_Y(:,:,frame)/blocksize,scale);
    axis equal;
    M(frame) = getframe;
    
end
status = fclose(fidX)
status = fclose(fidY)
implay(M,25);




