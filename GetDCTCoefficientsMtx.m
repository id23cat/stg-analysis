function M=GetDCTCoefficientsMtx(A)
% Функция возвращает [x,y,z] массив коэффициентов из массива A
% в каждом блоке 8x8
% x - высота/8, y - ширина/8, z - позиция в блоке коэффициентов по змейке

[x,y]=size(A);
M=zeros(x/8,y/8,64);
for i=1:64
	V=GetDCTCoefficientsVec(A,i);
	for j=1:x/8
		for k=1:y/8
			M(j,k,i)=V((j-1)*8+k);
		end
	end
end

end