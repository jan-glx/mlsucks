function [ out ] = ind2suba( sx,ind ) 
%IND2SUBA  eg. ind2suba([2 3],[1 2 3 1].')
%ans =
%     1     1
%     2     1
%     1     2
%     1     1
if (any(ind>prod(sx))||any(ind<1)); error('Index Out of Bounds!');end;
csx=cumprod(sx);
out=floor(bsxfun(@rdivide,bsxfun(@mod,ind-1,csx),[1,csx(1:end-1)]))+1;
end

