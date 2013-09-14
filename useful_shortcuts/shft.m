function [ x] = shft(x,offset )
%SHFT shifts the coordinates in X by OFFSET
x=bsxfun(@plus,x,offset);
end

