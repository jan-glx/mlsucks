function [ out ] = ind2subc( sx,ind )
%SUB2INDC  eg. ind2subc([2 3],[1 2 3])
%ans =     [1x3 double]    [1x3 double]
out=cell(1,numel(sx));
[out{:}]=ind2sub(sx,ind);
end

