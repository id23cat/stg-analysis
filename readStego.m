function Message=readStego(A, nbit, line, rnd, RGB)
%Message=readStego(A, nbit, line, rnd, RGB)
%	Извлечение данных из массив байтов методом LSB
%	A - Массив данных контейнера размерностью <1,len>, <h,W>, <h,w,RGB>
%	nbit - номер бита, из которого будет извлечен бит сообщения 1(LSB):8
%	line - строка или диапазон строк для извлечения <h>, <lb,le>( lb<le )
%	rnd - извлечения для случая случайного встраивания в строку или диапазон строк(~0), обычное(0) 
%	RGB - встраивание в выбранный компонент (1:3)
%	Message - Строка сообщения

mlen = uint32(0);
mlf = 0;	% флаг - длинна сообщения записана

[height, width, rgb] = size(A);
switch nargin
	case 1
		mi=1;
		mb=1;
		for i=1:rgb
			for j=1:height
				for k=1:width
					if mlf==0
						bit = bitget(A(j,k,i), 1);	%чтение длинны - 32 бита
						mlen = bitset(mlen,mb,bit);
						mb=mb+1;
						if mb>32
							mb=1;
							mlf=1;
							Message=uint8(zeros(1,mlen));
						end
					else
						bit = bitget(A(j,k,i), 1);		%чтение сообщения
						Message(mi)=bitset(Message(mi),mb,bit);
						mb=mb+1;
						if mb>8
							mi=mi+1;
							mb=1;
							if mi>length(Message)
								return;
							end
						end					
					end
				end
			end
		end
	case 2
		mi=1;
		mb=1;
		for i=1:rgb
			for j=1:height
				for k=1:width
					if mlf==0
						bit = bitget(A(j,k,i), nbit);	%чтение длинны - 32 бита
						mlen = bitset(mlen,mb,bit);
						mb=mb+1;
						if mb>32
							mb=1;
							mlf=1;
							Message=uint8(zeros(1,mlen));
						end
					else
						bit = bitget(A(j,k,i), nbit);		%чтение сообщения
						Message(mi)=bitset(Message(mi),mb,bit);
						mb=mb+1;
						if mb>8
							mi=mi+1;
							mb=1;
							if mi>length(Message)
								return;
							end
						end					
					end
				end
			end
		end
	case 3
		mi=1;
		mb=1;
		l=length(line);
		if l==1 && line < height
			for i=1:rgb
				for k=1:width
					if mlf==0
						bit = bitget(A(line,k,i), nbit);	%чтение длинны - 32 бита
						mlen = bitset(mlen,mb,bit);
						mb=mb+1;
						if mb>32
							mb=1;
							mlf=1;
							Message=uint8(zeros(1,mlen));
						end
					else
						bit = bitget(A(line,k,i), nbit);		%чтение сообщения
						Message(mi)=bitset(Message(mi),mb,bit);
						mb=mb+1;
						if mb>8
							mi=mi+1;
							mb=1;
							if mi>length(Message)
								return;
							end
						end					
					end	
				end
			end
		elseif l==2 && line(1)<line(2) && line(2)<height
			for i=1:rgb
				for j=line(1):line(2)
					for k=1:width
						if mlf==0
							bit = bitget(A(j,k,i), nbit);	%чтение длинны - 32 бита
							mlen = bitset(mlen,mb,bit);
							mb=mb+1;
							if mb>32
								mb=1;
								mlf=1;
								Message=uint8(zeros(1,mlen));
							end
						else
							bit = bitget(A(j,k,i), nbit);		%чтение сообщения
							Message(mi)=bitset(Message(mi),mb,bit);
							mb=mb+1;
							if mb>8
								mi=mi+1;
								mb=1;
								if mi>length(Message)
									return;
								end
							end					
						end
					end
				end
			end	
		else
			disp 'Error: using line argument fault'
			help readStego
		end		
		
	case 4
		defaultStream = RandStream.getDefaultStream;
		defaultStream.reset
		
		rIndex=randIndex(1,width);
		ri=1;
		l=length(line);
		if rnd && l==1 && line < height
			
			for i=1:32								%чтение длинны - 32 бита
% 				for j=1:8
					rindx=rIndex(ri);
					ri=ri+1;
					bit = bitget(A(line,rindx,1), nbit);					
					mlen = bitset(mlen,i,bit);					
					if ri==width+1
						return;
					end
% 				end
			end
			
			Message=uint8(zeros(1,mlen));
			for i=1:mlen
				for j=1:8
					rindx=rIndex(ri);
					ri=ri+1;
					bit = bitget(A(line,rindx,1), nbit);
					Message(i) = bitset(Message(i),j,bit);					
					if ri==width+1
						return;
					end
				end
			end
		
			
			
% 			for i=1:rgb
% 				for k=1:width
% 					if mlf==0
% 						bit = bitget(A(line,k,i), nbit);	%чтение длинны - 32 бита
% 						mlen = bitset(mlen,mb,bit);
% 						mb=mb+1;
% 						if mb>32
% 							mb=1;
% 							mlf=1;
% 							Message=uint8(zeros(1,mlen));
% 						end
% 					else
% 						bit = bitget(A(line,k,i), nbit);		%чтение сообщения
% 						Message(mi)=bitset(Message(mi),mb,bit);
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
		elseif rnd && l==2 && line(1)<line(2) && line(2)<height
			indlen1 = (line(1)-1)*width+1;
			indlen2 = (line(2))*width;
			rIndex=randIndex(indlen1,indlen2);
			ri=1;
			for i=1:32								%чтение длинны - 32 бита
% 				for j=1:8				
					rindx=rIndex(ri);
					ri=ri+1;
					xpos=idivide(rindx,int32(width));
					ypos=mod(rindx,width);
					bit = bitget(A(xpos,ypos,1), nbit);
					mlen = bitset(mlen,i,bit);					
% 				end
			end
			Message=uint8(zeros(1,mlen));
			for i=1:mlen
				for j=1:8
					rindx=rIndex(ri);
					ri=ri+1;
					xpos=idivide(rindx,int32(width));
					ypos=mod(rindx,width);

					bit = bitget(A(xpos,ypos,1), nbit);
					Message(i) = bitset(Message(i),j,bit);					
				end
			end
			
% 			for i=1:rgb
% 				for j=line(1):line(2)
% 					for k=1:width
% 						if mlf==0
% 							bit = bitget(A(j,k,i), nbit);	%чтение длинны - 32 бита
% 							mlen = bitset(mlen,mb,bit);
% 							mb=mb+1;
% 							if mb>32
% 								mb=1;
% 								mlf=1;
% 								Message=uint8(zeros(1,mlen));
% 							end
% 						else
% 							bit = bitget(A(j,k,i), nbit);		%чтение сообщения
% 							Message(mi)=bitset(Message(mi),mb,bit);
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
% 			end	
		else
			disp 'Error: using line argument fault'
			help readStego
		end			
		
	otherwise
		disp 'Error: Invalid count of arguments'
		help writeStego
end