function A=writeStegoRnd(A,percent,line1,line2,nbit, color)
%B=writeStegoRnd(A,percent,line1,line2,nbit, color)
%	Встраивание данных в массив байтов методом LSB
%	A - Массив данных контейнера размерностью <1,len>, <h,W>, <h,w,RGB>
%	percent - процент заполнения части массива
%	line1 - начальная строка из диапозона
%	line2 - конечная строка диапазона
%	nbit - номер бита, в который будет встроен бит сообщения 1(LSB):8
%	color - номер цвета
%	
%	

[height, width, rgb] = size(A);
mlen=round(((line2-line1+1)*width/8)*percent/100)-1;
Message = genRndMessage(mlen);

defaultStream = RandStream.getDefaultStream;
defaultStream.reset;
indlen1 = (line1-1)*width+1;
indlen2 = (line2)*width;
rIndex=randIndex(indlen1,indlen2);
ri=1;
switch nargin
	case 6
		for i=1:mlen		% длинна сообщения + 4 бита длинны
			for j=1:8		% 8 бит
				bit = bitget(Message(i), j);	%запись сообщения					
				rindx=rIndex(ri);
				ri=ri+1;
				xpos=idivide(rindx,int32(width))+1;
				ypos=mod(rindx,width)+1;
				A(xpos,ypos,color)=bitset(A(xpos,ypos,color),nbit,bit);
		% 		if ri==width+1
		% 			return;
		% 		end
			end
		end
	case 5
		for k=1:rgb
			for i=1:mlen		% длинна сообщения + 4 бита длинны
				for j=1:8		% 8 бит
					bit = bitget(Message(i), j);	%запись сообщения					
					rindx=rIndex(ri);
					ri=ri+1;
					xpos=idivide(rindx,int32(width))+1;
					ypos=mod(rindx,width)+1;
					A(xpos,ypos,k)=bitset(A(xpos,ypos,k),nbit,bit);
			% 		if ri==width+1
			% 			return;
			% 		end
				end
			end
		end
	otherwise
		disp 'Read Help:'
		help wirteStegoRnd
end