function [ h ] = selectfig( h )
%SELECTFIG Summary of this function goes here
%   Detailed explanation goes here
if (ishandle(h) && strcmp(get(h,'type'),'figure'))
    set(0,'CurrentFigure',h)
else
    h=figure(h);
end
end

