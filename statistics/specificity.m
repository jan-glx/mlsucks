function [ specificity ] = specificity( cm,prior )
%SPECIFICITY tn/n

if exist('prior','var')
    cm=bsxfun(@times,cm,prior.'./sum(cm,2));
end
%   Detailed explanation goes here
specificity=cm(1,1)/sum(cm(1,:));
end

