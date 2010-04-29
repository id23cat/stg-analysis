% initstego
% Стего
bitn=2;
color=1;
line = 2;
% line =  round(height/2);
lfirst = line;
llast = line;
ff=0;
ymin=-80;
ymax=80;
percent=90;

%%%%%%%%%% R %%%%%%%%%%%%%%%%%%%%%%%%
color=1;
IR=get2DBitSignal(IMG(:,:,color));
% IG=get2DBitSignal(IMG(:,:,2));
% IB=get2DBitSignal(IMG(:,:,3));
%Message='Йоссариан лежал в госпитале с болями в печени. Подозрение падало на  желтуху.  Однако для настоящей ';
%Message = uint8(randIndex(0,255));
% Message = genRndMessage(width*height/8);
%Mlen = length(Message);
%IMGS=writeStego(IMG,Message,bitn,line,1,1);	
% IMGS=writeStego(IMG,Message,bitn,line,1);		% в 1 бит, 4 строка
% IMGS=writeStego(IMG,Message,bitn,[1 3]);		% в 1 бит, все строки

IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
disp '%%%%%%%%%% R %%%%%%%%%%%%%%%%%%%%%%%%'
ISR=get2DBitSignal(IMGS(:,:,color));
% ISG=get2DBitSignal(IMGS(:,:,2));
% ISB=get2DBitSignal(IMGS(:,:,3));

sIR=std(IR(line,:,bitn))
sISR=std(ISR(line,:,bitn))
sIR2=std(IR(line,:,bitn+1))

pr=(sIR2-sIR)/sIR2*100
prs=(sIR2-sISR)/sIR2*100
disp 'end'

%%%%%%%%%% G %%%%%%%%%%%%%%%%%%%%%%%%
color=2;
IG=get2DBitSignal(IMG(:,:,color));
% IG=get2DBitSignal(IMG(:,:,2));
% IB=get2DBitSignal(IMG(:,:,3));
%Message='Йоссариан лежал в госпитале с болями в печени. Подозрение падало на  желтуху.  Однако для настоящей ';
%Message = uint8(randIndex(0,255));
% Message = genRndMessage(width*height/8);
%Mlen = length(Message);
%IMGS=writeStego(IMG,Message,bitn,line,1,1);	
% IMGS=writeStego(IMG,Message,bitn,line,1);		% в 1 бит, 4 строка
% IMGS=writeStego(IMG,Message,bitn,[1 3]);		% в 1 бит, все строки

IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
disp '%%%%%%%%%% G %%%%%%%%%%%%%%%%%%%%%%%%'
ISG=get2DBitSignal(IMGS(:,:,color));
% ISG=get2DBitSignal(IMGS(:,:,2));
% ISB=get2DBitSignal(IMGS(:,:,3));

sIG=std(IG(line,:,bitn))
sISG=std(ISG(line,:,bitn))
sIG2=std(IG(line,:,bitn+1))

pg=(sIG2-sIG)/sIG2*100
pgs=(sIG2-sISG)/sIG2*100
disp 'end'
%%%%%%%%%% B %%%%%%%%%%%%%%%%%%%%%%%%
color=3;
IB=get2DBitSignal(IMG(:,:,color));
% IG=get2DBitSignal(IMG(:,:,2));
% IB=get2DBitSignal(IMG(:,:,3));
%Message='Йоссариан лежал в госпитале с болями в печени. Подозрение падало на  желтуху.  Однако для настоящей ';
%Message = uint8(randIndex(0,255));
% Message = genRndMessage(width*height/8);
%Mlen = length(Message);
%IMGS=writeStego(IMG,Message,bitn,line,1,1);	
% IMGS=writeStego(IMG,Message,bitn,line,1);		% в 1 бит, 4 строка
% IMGS=writeStego(IMG,Message,bitn,[1 3]);		% в 1 бит, все строки

IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
disp '%%%%%%%%%% B %%%%%%%%%%%%%%%%%%%%%%%%'
ISB=get2DBitSignal(IMGS(:,:,color));
% ISG=get2DBitSignal(IMGS(:,:,2));
% ISB=get2DBitSignal(IMGS(:,:,3));

sIB=std(IB(line,:,bitn))
sISB=std(ISB(line,:,bitn))
sIB2=std(IB(line,:,bitn+1))

pb=(sIB2-sIB)/sIB2*100
pbs=(sIB2-sISB)/sIB2*100
disp 'end'

% % DCT над стего
% CIS2=zeros(height, width, bits);
% disp 'DCT 2 :'
% % for i=1:height
% %for i=line-1:line+1
% i=line;
% 	for j=1:bits
% 		CIS2(i,:,j)=dct(IS2(i,:,j));
% 		
% 	end
% % end
% disp 'yes'
% 
% disp 'FFT2 :'
% FIS2=fft(IS2(line,:,bitn));
% FIS2=fftshift(FIS2);
% FIS2=abs(FIS2);
% disp 'yes'

% FFT над стего
% FIS2=zeros(height, width, bits);
% disp 'FFT2 :'
% for i=1:height
% 	for j=1:bits
% 		FIS2(i,:,j)=fft(IS2(i,:,j));
% 		FIS2(i,:,j)=fftshift(FIS2(i,:,j));
% 		FIS2=abs(FIS2);
% 	end
% end
% disp 'yes'
% plotBitSignals(FIS2,1);				% 6