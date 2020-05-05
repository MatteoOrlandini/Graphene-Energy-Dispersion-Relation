function [x, y] = hexagon2(size,x0,y0)
    %size= side size;,(x0,y0) exagon center coordinates;
    x=size*sqrt(3)*[-0.5 0 0.5 0.5 0 -0.5 -0.5]+x0;
    y=size*[0.5 1 0.5 -0.5 -1 -0.5 0.5]+y0;    
end