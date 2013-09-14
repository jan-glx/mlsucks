function [ y ] = cell2cellocells( x,dims )
%CELL2CELLOCELLS Summary of this function goes here
%   Detailed explanation goes here
sX=size(x);
nD=ndims(sX);

dimsK=setdiff(1:nD,dims);

sY=sX;sY(dims)=1;
y=cell(sY);

x=permute(x,[dims,dimsK]);
if(length(dims)==1)
    
    for i=1:prod(sX(dimsK))
        y{i}=x(:,i);
    end
else
    idx=arrayfun(@(s)1:s,sX(dims));
    for i=1:prod(sX(dimsK))
        y{i}=x(idx{:},i);
    end
end
end

