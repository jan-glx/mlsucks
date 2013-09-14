function c=mprod(a,b)
c=permute(sum(bsxfun(@times,a,permute(b,[1,4,2,3])),3),[1,2,4,3]);
end
