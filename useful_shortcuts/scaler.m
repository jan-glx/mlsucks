function [ scaler ] = scaler( A,mi,ma )
%SCALER scales the values of array A in a linear way that min(A(:))==mi and  max(A(:))==ma 
%	where mi == 0 and ma == 1 if scaler is called with one argument only. 
if(nargin==1)
  mi=0;ma=1;
end
if(strcmp(class(A),'uint8'))
    A=single(A);
end
shift=min(A(:));
scale=max(A(:))-shift;
scaler=(A-shift)/scale*(ma-mi)+mi;

end

