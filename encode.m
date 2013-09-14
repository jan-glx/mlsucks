function [ y ] = encode(x, code )
%ENCODE Summary of this function goes here
%   Detailed explanation goes here
n=numel(code+1);
m=ceil(log2(n));

code=[-Inf;code;Inf];
[~,y]=histc(x,code);
y=y-1;
switch m
    case m<=1
        y=logical(y);
    case m<=8
        y=uint8(y);
    case m<=16
        y=uint11116(y);
    case m<=32
        y=uint32(y);
    case m<=64
        y=uint64(y);
end