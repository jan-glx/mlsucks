function [ ret ] = ite( cond,then,els )
%ITE Summary of this function goes here
%   Detailed explanation goes here
if cond
    ret=then;
else
    ret=els;
end
end

