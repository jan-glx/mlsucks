function [ formatedstring ] = formatwe( a,b,space )
%FORMATWE Summary of this function goes here
%   Detailed explanation goes here
x=sprintf('%u',max( 1-floor(log10(b)),0));
if exist('space','var')&&space
    formatedstring=sprintf(['%0.' x 'f ± %0.' x 'f'],a,b);
else
    formatedstring=sprintf(['%0.' x 'f±%0.' x 'f'],a,b);
end
end

