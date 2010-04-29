function Indx=randIndex(imin,imax)
%function Indx=randIndex(imin,imax)
%Распределение индексов в случайном порядке
%imin -- нижний индекс
%imax -- верхний индекс
%Indx -- массив индексов
len=imax-imin+1;
Indx = rand(1,len);
for i=1:len
	ok=1;
	while(ok)
		rindx=randi([imin imax]);
		tmp=Indx==rindx;
		if sum(tmp)==0
			ok=0;
			Indx(i)=rindx;
		end
	end
end
	
