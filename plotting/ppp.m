function  fig=ppp( stack,clim,visib )
%PPP Summary of this function goes here
%   Detailed explanation goes here
if nargin<2
    visib='on';
else
    if visib
        visib='on';
    else
        visib='off';
    end
end
fig=figure('Visible', visib);
if(nargin>1&&~isempty(clim))
    if(max(stack(:))>1)
        stack=stack/255;
    end
    imagesc(stack(:,:,1),[0,1]);
else
    imagesc(stack(:,:,1));
end
colormap gray;daspect([1 1 1]);
drawnow;
end

