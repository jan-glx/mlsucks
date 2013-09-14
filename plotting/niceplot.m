function [  ] = niceplot( x,y1,y2,legendt)
%NICEPLOT Summary of this function goes here
%   Detailed explanation goes here



%# plot
fh = figure('color','w');
hold on
hc=plot(x,y1,'b','lineWidth',3);
set(hc, 'DisplayName', legendt{1});
hb=plot(x,y2,'w','lineWidth',7);
set(get(get(hb, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off');
hc=plot(x,y2,'r','lineWidth',3);
set(hc, 'DisplayName', legendt{2});
legend_handle=legend('show');
legend('boxoff')
xlimMin(0);ylim([0,1]);

set(gca,'fontName','Comic Sans MS','fontSize',18,'lineWidth',3,'box','off')

set(legend_handle, 'fontName','Comic Sans MS','fontSize',14,'Location','East');
xlabel('number of training samples');
ylabel('performance');
%# add an annotation 
 %annotation(fh,'textarrow',[0.4 0.55],[0.8 0.65],...
%     'string',sprintf('text%shere',char(10)),'headStyle','none','lineWidth',1.5,...
 %    'fontName','Comic Sans MS','fontSize',14,'verticalAlignment','middle','horizontalAlignment','left')


%# capture with export_fig
im = export_fig('-nocrop',fh);

%# add a bit of border to avoid black edges
im = padarray(im,[15 15 0],255);

%# make distortion grid
sfc = size(im);
[yy,xx]=ndgrid(1:7:sfc(1),1:7:sfc(2));
pts = [xx(:),yy(:)];
tf = cp2tform(pts+randn(size(pts)),pts,'lwm',12);
w = warning;
warning off images:inv_lwm:cannotEvaluateTransfAtSomeOutputLocations
imt = imtransform(im,tf);
warning(w)

%# remove padding
imt = imt(16:end-15,16:end-15,:);

figure('color','w')
imshow(imt)
end

