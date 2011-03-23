IMG=imread('./BMP/4.bmp');
%I1=get1DBitSignal(IMG(:,:,1));
% disp 'get2DBitSignal(IMG(:,:,1)) : '
color = 1;
[height, width, cols]=size(IMG);
% IR=get2DBitSignal(IMG(:,:,1));
% [height, width, bits]=size(IR);
%IG=get2DBitSignal(IMG(:,:,2));
%IB=get2DBitSignal(IMG(:,:,3));
% initstego;
% sIR=std(IR(line,:,bitn));
% disp 'IR1='
% disp (sIR)
% sISR=std(ISR(line,:,bitn));
% disp 'ISR1='
% disp (sISR)
% 
% 
% 
 x=1:width;
 y=1:height;
 IMG2=IMG.*2;
 IMG4=IMG.*4;
 IMG8=IMG.*8;
 IMG16=IMG.*16;
 figure; imshow(IMG); 
 figure; imshow(IMG2); 
 figure; imshow(IMG4); 
 figure; imshow(IMG8); 
 figure; imshow(IMG16); 
% 
% bitn = 2;
% 
% IMG=imread('./BMP/2.bmp');
% color = 1;
% [height, width, cols]=size(IMG);
% initstego;
% sIR=std(IR(line,:,bitn));
% disp 'IR2='
% disp( sIR)
% sISR=std(ISR(line,:,bitn));
% disp 'ISR2='
% disp( sISR)
% 
% 
% IMG=imread('./BMP/3.bmp');
% color = 1;
% [height, width, cols]=size(IMG);
% initstego;
% sIR=std(IR(line,:,bitn));
% disp 'IR3='
% disp( sIR)
% sISR=std(ISR(line,:,bitn));
% disp 'ISR3='
% disp (sISR)



% % DCT над исходным сигналом
% CI2=zeros(height, width, bits);
% disp 'DCT 1 : '
% % for i=1:height
% % for i=line-1:line+1
% i=line;
% 	for j=1:bits
% 		CI2(i,:,j)=dct(I2(i,:,j));		
% 	end
% % end
% disp 'yes'
% 
% 
% 
% 
% 
% % FFT над исходным сигналом
% % FI2=zeros(height, width, bits);
% disp 'FFT 1 :'
% FI2=fft(I2(line,:,bitn));
% FI2=fftshift(FI2);
% FI2=abs(FI2);
% 
% disp 'yes'

% for i=1:height
% 	for j=1:bits
% 		FI2(i,:,j)=fft(I2(i,:,j));
% 		FI2(i,:,j)=fftshift(FI2(i,:,j));
% 		FI2=abs(FI2);
% 	end
% end
% disp 'yes'
% plotBitSignals(FI2,1);				% 3


