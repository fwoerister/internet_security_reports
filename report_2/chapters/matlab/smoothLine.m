function smooth = smoothLine( line )
    windowSize = 30;
    b = (1/windowSize)*ones(1,windowSize);
    a = 1;
    smooth = filter(b,a,line);
end

