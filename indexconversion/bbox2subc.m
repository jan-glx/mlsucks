function [ subc ] = bbox2subc( bbox )
%BBOX2SUBC Summary of this function goes here
%   Detailed explanation goes here
subc=cellfun(@(x)x(1):x(2),num2cell(bbox,1),'UniformOutput',false);
end

