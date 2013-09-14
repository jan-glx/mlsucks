function [ sz ] = sizeDiff( x,y )
%SIZEDIFF Summary of this function goes here
%   Detailed explanation goes here
sx=size(x);
sy=size(y);
nDx=numel(sx);
nDy=numel(sy);
nD=max(nDx,nDy);
sz=[sx ones(1,nD-nDx)]-[sy ones(1,nD-nDy)];
end

