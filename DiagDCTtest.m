function [ P ] = DiagDCTtest( M, parts )
% function [ P ] = DiagDCTtest( M, parts )
% выполняет анализ побочных диагоналей блоков коэффициентов ДКП
% M -- матрица пикселей цветового компонента
% parts -- количество анализируемых частей (100 -> %)
% P -- вектор вероятностей нахождения стего в каждой части из parts

mdct=@dct2;

Mdct = blkproc(double(M),[8 8],mdct);
Dstd = blkproc(Mdct,[8 8],@stdDiag);
[h,w]=size(Dstd);
Dstdv=reshape(Dstd',1,h*w);

len = length(Dstdv);
lenpart = idivide(len,uint16(parts));

P=blkproc(Dstdv,[1 lenpart],@HistTest);
end

