function [ A ] = shiftdimsright( A,n )
%SHIFTDIMSRIGHT Summary of this function goes here
%   Detailed explanation goes here
nD=stufe(A);
if ~exist('n','var') || isempty(n)
    n=1;
end
if n>0
    A=permute(A,[nD+(1:n) 1:nD]);
elseif n<0
    A=permute(A,[1-n:nD 1:-n]);
end
end

