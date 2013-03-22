function [  Y,Cb,Cr ] = readKochLogSimple( file )
%  Чтение коэффициентов из лога, запись в соответсвующие компонент 8-ми
%  коэффициентов

count_co=64;		% 11

fl=length(file);
fim=sprintf('%sjpg',file(1:fl-3));
a=imread(fim);
[height,width,c]=size(a);
clear a;

[lY,lCb,lCr]=calcBlocksCount(height,width);
lY=lY*count_co;
lCb=lCb*count_co;
lCr=lCr*count_co;

len=(lY+lCb+lCr)*65*2;

fid = fopen(file,'rb');
assert(fid>0,'File %s not found',file);
fseek(fid,0,'eof');
len = ftell(fid);
fseek(fid,0,'bof');

% Mas = zeros(1,len/2,'int16');
lh=len/2;
Mas = fread(fid,lh,'int16');
fclose(fid);


end

