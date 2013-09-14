function [varargout]=errorbarxy(varargin)
%   ERRORBARXY is a function to generate errorbars on both x and y axes 
%   with specified errors modified from codes written by Nils Sjöberg 
%   (http://www.mathworks.com/matlabcentral/fileexchange/5444-xyerrorbar)
%  
%   errorbarxy(x, y, lx, ux, ly, uy) plots the data with errorbars on both 
%   x and y axes with error bars [x-lx, x+ux] and [y-ly, y+uy]. If there is
%   no error on one axis, set corresponding lower and upper bounds to [].
%
%   errorbarxy(x, y, errx, erry) plots the data with errorbars on both x and
%   y axes with error bars [x-errx, x+errx] and [y-erry, y+erry]. If there 
%   is no error on one axis, set corresponding errors to [].
%   
%   errorbarxy(..., COLOR) plots data as well as errorbars in specified
%   colors. COLOR is a cell array of 3 element, {cData, cEBx, cEBy}, where
%   cData specifies the color of main plot, cEBx specifies the color of
%   errorbars along x axis and cEBy specifies the color of errorbars along
%   y axis. 
%   
%   errorbarxy(AX,...) plots into AX instead of GCA.
%   
%   H = errorbar(...) returns a vector of errorbarseries handles in H,
%   within which the first element is the handle to the main data plot and
%   the remaining elements are handles to the rest errorbars.
%
%   For example
%       x = 1:10;
%       xe = 0.5*ones(size(x));
%       y = sin(x);
%       ye = std(y)*ones(size(x));
%       H=errorbarxy(x,y,xe,ye,{'k', 'b', 'r'});
%    draws symmetric error bars on both x and y axes.
%
%   NOTE: errorbars are excluded from legend display. If you need to
%   include errorbars in legend display, do the followings:
%       H=errorbarxy(...);
%       arrayfun(@(d) set(get(get(d,'Annotation'),'LegendInformation'),...
%       'IconDisplayStyle','on'), H(2:end)); % include errorbars
%       hEB=hggroup;
%       set(H(2:end),'Parent',hEB);
%       set(get(get(hEB,'Annotation'),'LegendInformation'),...
%       'IconDisplayStyle','on'); % include errorbars in legend as a group.
%       legend('Main plot', 'Error bars');
%
%   Developed under Matlab version 7.10.0.499 (R2010a)
%   Created by Qi An
%   anqi2000@gmail.com

%   QA 2/7/2013 initial skeleton
%   QA 2/12/2013    Added support to plot on specified axes; Added support
%                   to specify color of plots and errorbars; Output a
%                   vector of errbar series handles; Fixed a couple of 
%                   minor bugs. 
%   QA 2/13/2013    Excluded errorbars from legend display.

%% handle inputs
if ishandle(varargin{1}) % first argument is a handle
    if get(varargin{1}, 'type', 'axes') % the handle is for an axes
        axes(varargin{1}); % set the handle to be current
    
        varargin=varargin(2:end);
    end
end
if length(varargin)<4
    error('Insufficient number of inputs');
    return;
end

%% assign values
x=varargin{1};
y=varargin{2};
if length(x)~=length(y)
    error('x and y must have the same number of elements!')
    return
end
color={'b', 'r', 'r'};
if length(varargin)==4 || length(varargin)==5 
    errx=varargin{3};
    erry=varargin{4};
    if ~isempty(errx)
        lx=x-errx;
        ux=x+errx;
    else
        lx=[];
        ux=[];
    end
    if ~isempty(erry)
        ly=y-erry;
        uy=y+erry;
    else
        ly=[];
        uy=[];
    end
    
    if length(varargin)==5
        color=varargin{5};
    end
elseif length(varargin)==6 || length(varargin)==7 
    lx=varargin{3};
    ux=varargin{4};
    ly=varargin{5};
    uy=varargin{6};
    errx=(ux-lx);
    erry=(uy-ly)/2;   
    
    if length(varargin)==7
        color=varargin{7};
    end
else
    error('Wrong number of inputs!');
end

%% plot data and errorbars
h=plot(x,y, color{1}); % main plot
[l1, l2, l3, l4, l5, l6, hx,hy]=deal([]);
hold on;
for k=1:length(x)
    p=0.0;
    p2=0.01;
    if ~isempty(ly) % y errors are  specified
        l4=line([x(k) x(k)],[ly(k) uy(k)]);
        l5=line([x(k)-p*erry(k)-p2 x(k)+p*erry(k)+p2],[ly(k) ly(k)]);
        l6=line([x(k)-p*erry(k)-p2 x(k)+p*erry(k)+p2],[uy(k) uy(k)]);
    end
    if ~isempty(lx) % x errors are  specified
        l1=line([lx(k) ux(k)],[y(k) y(k)]);
        l2=line([lx(k) lx(k)],[y(k)-p*errx(k)-p2 y(k)+p*errx(k)+p2]);
        l3=line([ux(k) ux(k)],[y(k)-p*errx(k)-p2 y(k)+p*errx(k)+p2]);
    end
    hx=[hx, l1, l2, l3];
    hy=[hy, l4, l5, l6]; % a list of all handles
end
arrayfun(@(d) set(get(get(d,'Annotation'),'LegendInformation'), 'IconDisplayStyle','off'), [hx,hy]); % exclude errorbars from legend
hold off

%% handle outputs
if nargout>0
    varargout{1}=h;
end
if nargout==2
    varargout{2}=[hx hy];
end
if nargout==3
    varargout{2}=hx;
    varargout{3}=hy;
end


















