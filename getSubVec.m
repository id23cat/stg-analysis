function [ V,y0,x0 ] = getSubVec( A,y0,x0,lV )
%function [ V,x0,y0 ] = getSubVec( A,x0,y0,lV )
%	Возвращает вектор длинной lV, содержащий значения из матрицы A, начиная
%	с y0-й строки со смещением x0

% V=zeros(1,lV);
[ly,lx]=size(A);
vi=1;	%индекс по вектору
V=zeros(1,lV);
while 1
	lvi=lV-vi+1;	% длинна вектора от индекса vi до конца
	if(y0>ly || isnan(y0) || isnan(x0))
% 		V(vi:lV)=zeros(1,lV-vi+1);
		x0=NaN;
		y0=NaN;
		return;
	end
	if(lx-x0+1)>lvi
		V(vi:vi+lvi-1)=A(y0,x0:x0+lvi-1);
		x0=x0+lvi;
		if(x0>lx)
			y0=y0+1;
			x0=1;
		end
		if(y0>ly)
			y0=NaN;
			x0=NaN;
		end
		return;
	else
		V(vi:vi+(lx-x0))=A(y0,x0:lx);
		vi=vi+(lx-x0+1);
		x0=1;
		y0=y0+1;
% 		lvi=lvi-(lx-x0+1);
	end
end














% % if x0>1
% % 	V=A(y0,x0:lx);
% % 	lV=lV-(lx-x0+1);
% % end
% 
% if (lx-x0+1)>lV
% 	V=A(y0,x0:x0+lV-1);
% 	x0=x0+lV;
% elseif (lx-x0+1)==lV
% 	V=A(y0,x0:x0+lV-1);
% 	if y0<ly
% 		x0=1;
% 		y0=y0+1;
% 	else
% 		y0=NaN;
% 		x0=NaN;
% 	end
% else
% 	V=A(y0,x0:lx);
% 	lV=lV-(lx-x0+1);
% 
% 	cy=idivide(lV,int32(lx));
% 	cx=lV-lx*cy;
% 	y0=y0+1;
% 	if y0>ly
% % 		V=[V A(y0-1,1:lx)];
% 		V=[V zeros(1,cx)];
% 		x0=NaN;
% 		y0=NaN;
% 	else
% 
% 		for iy=0:cy-1
% 	 		if (y0+iy)<ly
% 	 			V=[V A(y0+iy,:)];
% 	 		else
% 				V=[V zeros(1,lx)];
% 	 		end
% 		end
% 		if y0<=ly
% 			y0=y0+cy;
% 			if cx>0
% 				V=[V A(y0,1:cx)];
% 				x0=cx+1;		
% 			end
% 		else
% 			y0=NaN;
% 			x0=NaN;
% 		end		
% 	end	
% end
end
