function [ recall ] = recall( cm,prior )
%RECALL  correctly positve predicted/positve == tp/(tp+fn) cm(true class,predicted class) idx 2: positve idx1: negative
if exist('prior','var')
    cm=bsxfun(@times,cm,bsxfun(@rdivide,prior.',sum(cm,2)));
end
%   Detailed explanation goes here
recall=cm(2,2,:)/sum(cm(2,:,:),2);
end
