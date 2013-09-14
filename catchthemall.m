function out=catchthemall(f,n,varargin)
if(~exist('n','var')||isempty(n))
    n=nargout(f);
end
out=cell(1,n);
[out{:}]=f(varargin{:});
end

