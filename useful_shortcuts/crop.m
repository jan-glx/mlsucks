function [ x ] = crop( x,mini,maxi )
%CROP Summary of this function goes here
%   Detailed explanation goes here
x=min(max(x,mini),maxi);
end

