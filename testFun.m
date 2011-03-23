function [ bitstd,bitdct,bitstd2,stdmean ] = testFun( B )
% тестовая функция
%   Detailed explanation goes here
windlen1=20;
windlen2=50;

B1=bitget(B,1);
[i,j]=size(B1);
B1v=reshape(B1',1,i*j);
% B1v=B1v(1:length(bitstd));
bitstd=nlfilter(double(B1v),[1 windlen1],@std);
% x4=1:length(bitstd);
bitdct=dct(bitstd);
i=length(bitdct);
bitstd2=blkproc(double(bitdct(2:i)),[1 windlen2],@std);
% y4=1:length(stdmdct4);
stdmean=blkproc(bitstd2,[1 10],@mean);

end

