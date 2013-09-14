function [ cell ] = cellocells2cell( cells,dim )
%CELLOCELLS2CELL Summary of this function goes here
%   Detailed explanation goes here
if(~exist('dim','var'))
    dim=1;
end
cell=cat(dim,cells{:});   

end

