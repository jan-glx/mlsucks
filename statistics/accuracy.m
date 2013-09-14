function [ accuracy ] = accuracy( cm,prior )
%ACCURACY Summary of this function goes here
%   Detailed explanation goes here
if exist('prior','var')
    cm=bsxfun(@times,cm,prior.'./sum(cm,2));
end
accuracy=sum(cm(eye(2)==1))/sum(cm(:));
end

