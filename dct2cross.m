function [ V ] = dct2cross( M )
% Фукнция принимает блок пикселей 8х8 для построчного и постолбцового
% анализа

[h,w]=size(M);
% Str=zeros(1,h);
% Row=zeros(1,w);
row=blkproc(M,[1 w],@std);
col=blkproc(M,[h 1],@std);
V=zeros(h,w);
for i=1:h
	for j=1:w
		V(i,j)=row(i)+col(j);
	end
end

end

