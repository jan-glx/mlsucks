function [ suba ] = subl2suba( subl )
%SUBL2SUBA Summary of this function goes here
%   Detailed explanation goes here
siz=size(subl);
ind=find(subl);
suba=ind2suba(siz,ind);
end

