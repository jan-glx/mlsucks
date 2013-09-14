function [ A,names ] = gml2am2( fileName,forceSymetry)
%GML2AM Summary of this function goes here
%   Detailed explanation goes here
if nargin==1
    forceSymetry=false;
end

inputfile = fopen(fileName);
rawdata=fread(inputfile,'uint8=>char');
fclose(inputfile);

names= regexp(rawdata.','label "(.*?)"','tokens');
ids=regexp(rawdata.','id (\d+)','tokens');
if(isempty(names))
    names=ids;
end
ids=cellfun(@str2double,ids);
offset=min(ids);
ids=ids+1-offset;
names=[names{ids}] ;

from= cellfun(@str2double,regexp(rawdata.','source (\d+)','tokens'));
to = cellfun(@str2double,regexp(rawdata.','target (\d+)','tokens'));
strength = cellfun(@str2double,regexp(rawdata.','value (\d+)','tokens'));


from=from+1-offset;
to=to+1-offset;
n=max(ids);
A=zeros(n,n);

for i=1:length(from)
    if(isempty(strength))
        s=1;
    else
        s=strength(i);
    end
    A(from(i),to(i))=A(from(i),to(i))+s;
end
if(forceSymetry)
    A=A+A.';
    A=A/min(min(A(A>0)));
end







