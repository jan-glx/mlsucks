function [ idx ] = suba2ind( sx,idx )
%SUBA2IND e.g. [ idx ] = suba2ind( [3,5],[1,3;1,4;1,5;1,1] )
if isempty(idx)
 idx=zeros(0,1);
else
sy=size(idx);sy=sy([1 3:ndims(idx)]);
idx=num2cell(idx,[1 3:numel(sx)]);


idx=cellfun(@flat,idx,'UniformOutput',false);
idx=sub2ind(sx,idx{:});
idx=reshape(idx,[sy 1]); %ml sucks
end
end
