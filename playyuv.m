function playyuv(File,width,height,format,fps)
 mov = yuv2mov(File,width,height,format);
 implay (mov,fps);
end