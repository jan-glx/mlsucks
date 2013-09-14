function [ informedness ] = informedness( varargin )
%INFORMEDNESS Summary of this function goes here
%   Detailed explanation goes here
informedness=sensitivity(varargin{:})+specificity(varargin{:})-1;
end

