function [ precision ] = precision( cm,prior )
%PRECISION  correctly positve predicted/positve predicted == tp/(tp+fn)cm(true class,predicted class) idx 2: positve idx1: negative
if exist('prior','var')
    cm=bsxfun(@times,cm,prior.'./sum(cm,2));
end
%   Detailed explanation goes here
precision=cm(2,2)/sum(cm(:,2));
end

