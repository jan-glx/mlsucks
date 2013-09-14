function [ varargout ] = cellfunn(n,f,varargin)
%CELLFUNN Summary of this function goes here
%   Detailed explanation goes here
    if(isempty(n))
        n=nargout(f);
    end
    out=cellfun(@(varargin)catchthemall(f,n,varargin{:}),varargin{:},'UniformOutput',false);
    out=cellocells2cell(out,1);
    varargout=cell2cellocells(out,1);
end


