function [ varargout ] = sensitivity( varargin)
%SENSITIVITY Summary of this function goes here
%   Detailed explanation goes here
varargout=cell(1,max(nargout,1));
[varargout{:}]=recall(varargin{:});
end

