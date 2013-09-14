function  pp( what,pps ,cmap)
%PP Summary of this function goes here
%   Detailed explanation goes here
if ~exist('pps','var')||isempty(pps)
    % Load auto KLEE colormap
    pps=10;
end
if ~exist('cmap','var')||isempty(cmap)
    % Load auto KLEE colormap
    cmap='gray';
end
handle=figure;
colormap(cmap);
zz=size(what);
zz=zz(3:end);
closed=false;
mini=min(what(:));
maxi=max(what(:));
if(zz>0)
    while true
        for z=1:prod(zz)
            if ~(ishandle(handle) && strcmp(get(handle,'type'),'figure'))
                closed=true;
                break;
            end
            set(0,'CurrentFigure',handle);
            imagesc(what(:,:,z),[mini maxi]);
            daspect([1 1 1]);
            drawnow;
            pause(1/pps);
        end
        if closed
            break;
        end
    end
else
    imagesc(what(:,:));
    daspect([1 1 1]);
end
