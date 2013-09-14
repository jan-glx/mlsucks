function [ nD ] = stufe( x )
%MYNDIMS Summary of this function goes here
%   Detailed explanation goes here
nD=ndims(x);
if nD<3
    sX=size(x);
    if(sX(2)==1)
        nD=1;
        if(sX(1)==1)
            nD=0;
        end
    end
end
if isempty(x)
    nD=nan;
end
end

