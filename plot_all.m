pltf=1;
pltcol=0;
neib=1;

ymin=-20;
ymax=20;
ymin=min([ymin min(IR(line,:,bitn)) min(IR(line-1,:,bitn)) min(IR(line+1,:,bitn))]);
ymin=min([ymin min(ISR(line,:,bitn)) min(ISR(line-1,:,bitn)) min(ISR(line+1,:,bitn))]);
ymax=max([ymax max(IR(line,:,bitn)) max(IR(line-1,:,bitn)) max(IR(line+1,:,bitn))]);
ymax=max([ymax max(ISR(line,:,bitn)) max(ISR(line-1,:,bitn)) max(ISR(line+1,:,bitn))]);

x=1:width;
% Исходный сигнал
if(pltf)
	disp 'plotBitSignals(IR,1) : '
	if neib
		plotBitSignals(IR,'Исходный сигнал',line,1,ymin,ymax,bitn);				% 1
	else
		plotBitSignals(IR,'Исходный сигнал',line);				% 1
	end
	figure('Name', 'Исходный сигнал: 1 бит');
	%title('Исходный сигнал')
	if neib
		if line==1
			plot(x,IR(line,:,bitn),'b',x,IR(line+1,:,bitn),'g');
		else
			plot(x,IR(line,:,bitn),'b',x,IR(line-1,:,bitn),'r',x,IR(line+1,:,bitn),'g');
			axis( [ 0, width, ymin, ymax ] );
		end
	else
		plot(x,IR(line,:,bitn),'b');
	end
	disp 'yes'
end

% if(pltf)
% 	if neib
% 		plotBitSignals(CI2,'DCT исходного сигнала',line,1);				% 2
% 	else
% 		plotBitSignals(CI2,'DCT исходного сигнала',line);				% 2
% 	end
% 	figure
% 	title('DCT исходного сигнала');
% 	if neib
% 		if line==1
% 			plot(x,CI2(line,:,bitn),'b',x,CI2(line+1,:,bitn),'g');
% 		else
% 			plot(x,CI2(line,:,bitn),'b',x,CI2(line-1,:,bitn),'r',x,CI2(line+1,:,bitn),'g');
% 		end
% 	else
% 		plot(x,CI2(line,:,bitn),'b');
% 	end
% end
% 
% if(pltf)
% 	figure
% 	title('FFT исходного сигнала');
% 	if neib
% 		FI20=fft(I2(line-1,:,bitn));
% 		FI20=fftshift(FI20);
% 		FI20=abs(FI20);
% 		FI21=fft(I2(line+1,:,bitn));
% 		FI21=fftshift(FI21);
% 		FI21=abs(FI21);
% 		plot(x, FI2,'b',x, FI20,'r',x, FI21,'g');
% 	else
% 		plot(x, FI2,'b');
% 	end
% end

if(pltf)
	disp 'plotBitSignals(ISR,1) :'
	if neib
		plotBitSignals(ISR,'Стего сигнал',line,1,ymin,ymax,bitn);				% 4
	else
		plotBitSignals(ISR,'Стего сигнал',line);				% 4
	end
	disp 'yes'
	figure('Name', 'Стего сигнал');
	if neib
		plot(x,ISR(line,:,bitn),'b',x,ISR(line-1,:,bitn),'r',x,ISR(line+1,:,bitn),'g');
		axis( [ 0, width, ymin, ymax ] )
	else
		plot(x,ISR(line,:,bitn),'b');
	end
end

if(pltcol)
	disp 'plotBitSignals(IG,1) :'
	if neib
		plotBitSignals(IG,'G канал',line,1,ymin,ymax);				% 4
	else
		plotBitSignals(IG,'G канал',line);				% 4
	end
	disp 'yes'
	figure('Name', 'G канал');
	if neib
		plot(x,IR(line+15,:,bitn),'w',x,IG(line,:,bitn),'b',x,IG(line-1,:,bitn),'r',x,IG(line+1,:,bitn),'g');
	else
		plot(x,IG(line,:,bitn),'b');
	end
end

if(pltcol)
	disp 'plotBitSignals(IB,1) :'
	if neib
		plotBitSignals(IB,'B канал',line,1,ymin,ymax);				% 4
	else
		plotBitSignals(IB,'B канал',line);				% 4
	end
	disp 'yes'
	figure('Name', 'B канал');
	if neib
		plot(x,IR(line+15,:,bitn),'w',x,IB(line,:,bitn),'b',x,IB(line-1,:,bitn),'r',x,IB(line+1,:,bitn),'g');
		
	else
		plot(x,IB(line,:,bitn),'b');
	end
end

% if(pltf)
% 	if neib
% 		plotBitSignals(CIS2,'DCT стего сигнала',line,1);				% 5
% 	else
% 		plotBitSignals(CIS2,'DCT стего сигнала',line);
% 	end
% 	figureh
% 	title('DCT стего сигнала');
% 	if neib
% 		plot(x,CIS2(line,:,bitn),'b',x,CIS2(line-1,:,bitn),'r',x,CIS2(line+1,:,bitn),'g');
% 	else
% 		plot(x,CIS2(line,:,bitn),'b');
% 	end
% end
% 
% if(pltf)
% 	figure
% 	title('FFT исходного сигнала');
% 	if neib
% 		FIS20=fft(IS2(line-1,:,bitn));
% 		FIS20=fftshift(FIS20);
% 		FIS20=abs(FIS20);
% 		FIS21=fft(IS2(line+1,:,bitn));
% 		FIS21=fftshift(FIS21);
% 		FIS21=abs(FIS21);
% 		plot(x,FIS2,'b',x,FIS20,'r',x,FIS21,'g');
% 	else
% 		plot(x,FIS2);
% 	end
% 	
% end