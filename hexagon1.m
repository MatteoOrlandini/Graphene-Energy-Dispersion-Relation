function hexagon1(size,x0,y0)
    %size= side size;,(x0,y0) exagon center coordinates;
    x=size*sqrt(3)*[-1 -0.5 0.5 1 0.5 -0.5 -1]+x0;
    y=size*[0 0.5 0.5 0 -0.5 -0.5 0]+y0;
    figure ('Name','Unit cell','NumberTitle','off');
    plot(x,y);
    %axis([ x0-size x0+size y0-size y0+size]);
    %text(size*0.5,size*sqrt(3)*0.5,'sqrt(3)*a/2,a/2');
end