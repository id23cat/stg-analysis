function A=writeStego(A, Message, nbit, line, rnd, RGB)
%B=writeStego(A, Message, bit, line, rnd, RGB)
%	Встраивание данных в массив байтов методом LSB
%	A - Массив данных контейнера размерностью <1,len>, <h,W>, <h,w,RGB>
%	Message - Строка сообщения
%	nbit - номер бита, в который будет встроен бит сообщения 1(LSB):8
%	line - строка или диапазон строк для встраивания <h>, <lb,le>( lb<le )
%	rnd - случайное встраивание в строку или диапазон строк(~0), обычное(0) 
%	RGB - встраивание в выбранный компонент (1:3)
%	B - массив с той же размерностью, что и A

Message = uint8(Message);
% mlen = uint32(length(Message));
%mlf = 0;	% флаг - длинна сообщения записана
mlen = typecast(uint32(length(Message)),'uint8');
Message=[mlen Message];
mlen = length(Message);


[height, width, rgb] = size(A);
switch nargin
	case 2
		mi=1;
		mb=1;
		for i=1:rgb
			for j=1:height
				for k=1:2:width					
					bit = bitget(Message(mi), mb);	%запись сообщения
					A(j,k,i)=bitset(A(j,k,i),1,bit);
					mb=mb+1;
					if mb>8
						mi=mi+1;
						mb=1;
						if mi>mlen
							return;
						end
					end					
				end
			end
		end
	case 3
		mi=1;
		mb=1;
		for i=1:rgb
			for j=1:height
				for k=1:width
					bit = bitget(Message(mi), mb);	%запись сообщения
					A(j,k,i)=bitset(A(j,k,i),nbit,bit);
					mb=mb+1;
					if mb>8
						mi=mi+1;
						mb=1;
						if mi>mlen
							return;
						end
					end					
				end
			end
		end
	case 4
		mi=1;
		mb=1;
		l=length(line);
		if l==1 && line < height
			for i=1:rgb
				for k=1:width
					bit = bitget(Message(mi), mb);	%запись сообщения
					A(line,k,i)=bitset(A(line,k,i),nbit,bit);
					mb=mb+1;
					if mb>8
						mi=mi+1;
						mb=1;
						if mi>mlen
							return;
						end
					end					
				end				
			end
		elseif l==2 && line(1)<line(2) && line(2)<=height
			for i=1:rgb
				for j=line(1):line(2)
					for k=1:width
						bit = bitget(Message(mi), mb);	%запись сообщения
						A(j,k,i)=bitset(A(j,k,i),nbit,bit);
						mb=mb+1;
						if mb>8
							mi=mi+1;
							mb=1;
							if mi>mlen
								return;
							end
						end
					end
				end
			end
		else
			disp 'Error: using line argument fault'
			help writeStego
		end		
	case 5
		defaultStream = RandStream.getDefaultStream;
		defaultStream.reset
		l=length(line);
		if l==1 && line < height
			rIndex=randIndex(1,width);	% массив случайно распределенных индексов
			ri=1;
			for i=1:mlen		% длинна сообщения + 4 байта длинны
				for j=1:8		% 8 бит
					bit = bitget(Message(i), j);	%запись сообщения
					rindx=rIndex(ri);
					ri=ri+1;					
					A(line,rindx,1)=bitset(A(line,rindx,1),nbit,bit);
					if ri==width+1
						return;
					end
				end
			end
			
			
% 			for i=1:rgb
% 				for k=1:width
% 					if mlf==0
% 						bit = bitget(mlen, mb);	%запись длинны - 32 бита
% 						A(line,k,i)=bitset(A(line,k,i),nbit,bit);
% 						mb=mb+1;
% 						if mb>32
% 							mb=1;
% 							mlf=1;
% 						end
% 					else
% 						bit = bitget(Message(mi), mb);	%запись сообщения
% 						A(line,k,i)=bitset(A(line,k,i),nbit,bit);
% 						mb=mb+1;
% 						if mb>8
% 							mi=mi+1;
% 							mb=1;
% 							if mi>length(Message)
% 								return;
% 							end
% 						end					
% 					end
% 				end				
% 			end
		elseif l==2 && line(1)<line(2) && line(2)<=height
			indlen1 = (line(1)-1)*width+1;
			indlen2 = (line(2))*width;
			rIndex=randIndex(indlen1,indlen2);
			ri=1;
			for i=1:mlen		% длинна сообщения + 4 бита длинны
				for j=1:8		% 8 бит
					bit = bitget(Message(i), j);	%запись сообщения					
					rindx=rIndex(ri);
					ri=ri+1;
					xpos=idivide(rindx,int32(width));
					ypos=mod(rindx,width);
					A(xpos,ypos,1)=bitset(A(xpos,ypos,1),nbit,bit);
					if ri==width+1
						return;
					end
				end
			end	
			
			
% 			for i=1:rgb
% 				for j=line(1):line(2)
% 					for k=1:width
% 						if mlf==0
% 							bit = bitget(mlen, mb);	%запись длинны - 32 бита
% 							A(j,k,i)=bitset(A(j,k,i),nbit,bit);
% 							mb=mb+1;
% 							if mb>32
% 								mb=1;
% 								mlf=1;
% 							end
% 						else
% 							bit = bitget(Message(mi), mb);	%запись сообщения
% 							A(j,k,i)=bitset(A(j,k,i),nbit,bit);
% 							mb=mb+1;
% 							if mb>8
% 								mi=mi+1;
% 								mb=1;
% 								if mi>length(Message)
% 									return;
% 								end
% 							end			
% 						end
% 					end
% 				end
%			end	
		else
			disp 'Error: using line argument fault'
			help writeStego
		end		
	case 6
		defaultStream = RandStream.getDefaultStream;
		defaultStream.reset
		l=length(line);
		if l==1 && line < height
			rIndex=randIndex(1,width);	% массив случайно распределенных индексов
			ri=1;
			for i=1:mlen		% длинна сообщения + 4 байта длинны
				for j=1:8		% 8 бит
					bit = bitget(Message(i), j);	%запись сообщения
					rindx=rIndex(ri);
					ri=ri+1;					
					A(line,rindx,1)=bitset(A(line,rindx,RGB),nbit,bit);
					if ri==width+1
						return;
					end
				end
			end
			
			
% 			for i=1:rgb
% 				for k=1:width
% 					if mlf==0
% 						bit = bitget(mlen, mb);	%запись длинны - 32 бита
% 						A(line,k,i)=bitset(A(line,k,i),nbit,bit);
% 						mb=mb+1;
% 						if mb>32
% 							mb=1;
% 							mlf=1;
% 						end
% 					else
% 						bit = bitget(Message(mi), mb);	%запись сообщения
% 						A(line,k,i)=bitset(A(line,k,i),nbit,bit);
% 						mb=mb+1;
% 						if mb>8
% 							mi=mi+1;
% 							mb=1;
% 							if mi>length(Message)
% 								return;
% 							end
% 						end					
% 					end
% 				end				
% 			end
		elseif l==2 && line(1)<line(2) && line(2)<=height
			indlen1 = (line(1)-1)*width+1;
			indlen2 = (line(2))*width;
			rIndex=randIndex(indlen1,indlen2);
			ri=1;
			for i=1:mlen		% длинна сообщения + 4 бита длинны
				for j=1:8		% 8 бит
					bit = bitget(Message(i), j);	%запись сообщения					
					rindx=rIndex(ri);
					ri=ri+1;
					xpos=idivide(rindx,int32(width));
					ypos=mod(rindx,width);
					A(xpos,ypos,1)=bitset(A(xpos,ypos,RGB),nbit,bit);
					if ri==width+1
						return;
					end
				end
			end	
			
			
% 			for i=1:rgb
% 				for j=line(1):line(2)
% 					for k=1:width
% 						if mlf==0
% 							bit = bitget(mlen, mb);	%запись длинны - 32 бита
% 							A(j,k,i)=bitset(A(j,k,i),nbit,bit);
% 							mb=mb+1;
% 							if mb>32
% 								mb=1;
% 								mlf=1;
% 							end
% 						else
% 							bit = bitget(Message(mi), mb);	%запись сообщения
% 							A(j,k,i)=bitset(A(j,k,i),nbit,bit);
% 							mb=mb+1;
% 							if mb>8
% 								mi=mi+1;
% 								mb=1;
% 								if mi>length(Message)
% 									return;
% 								end
% 							end			
% 						end
% 					end
% 				end
%			end	
		else
			disp 'Error: using line argument fault'
			help writeStego
		end		
	otherwise
		disp 'Error: Invalid count of arguments'
		help writeStego
end