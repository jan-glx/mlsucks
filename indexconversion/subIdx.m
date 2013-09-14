function [ y ] = subIdx( x,varargin )
%SUBIDX Summary of this function goes here
%   Detailed explanation goes here
if iscell(varargin{1})
    y=x(varargin{1}{:});
else
    y=x(varargin{:});
end
end

