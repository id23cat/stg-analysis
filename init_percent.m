%init_percent
bitn=2;
 line =  round(height/2);
%line = 5
lfirst = line-1;
llast = line+1;
ff=0;
ymin=-80;
ymax=80;

%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Исходный сигнал: 1 бит');
IR=get2DBitSignal(IMG(:,:,1),bitn,line);
ymin=min([ymin min(IR(1,:)) min(IR(2,:)) min(IR(3,:))]);
ymax=max([ymax max(IR(1,:)) max(IR(2,:)) max(IR(3,:))]);
subplot(2,4,1);
% plot(x,IR(line,:,bitn),'b',x,IR(line-1,:,bitn),'r',x,IR(line+1,:,bitn),'g');
plot(x,IR(1,:),'b',x,IR(2,:),'r',x,IR(3,:),'g');
axis( [ 0, width, ymin, ymax ] )

percent=5;
IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
subplot(2,4,2);
plot(x,ISR(1,:),'b',x,ISR(2,:),'r',x,ISR(3,:),'g');
axis( [ 0, width, ymin, ymax ] )

percent=20;
IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
subplot(2,4,3);
plot(x,ISR(1,:),'b',x,ISR(2,:),'r',x,ISR(3,:),'g');
axis( [ 0, width, ymin, ymax ] )

percent=30;
IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
subplot(2,4,4);
plot(x,ISR(1,:),'b',x,ISR(2,:),'r',x,ISR(3,:),'g');
axis( [ 0, width, ymin, ymax ] )

percent=50;
IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
subplot(2,4,5);
plot(x,ISR(1,:),'b',x,ISR(2,:),'r',x,ISR(3,:),'g');
axis( [ 0, width, ymin, ymax ] )

percent=70;
IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
subplot(2,4,6);
plot(x,ISR(1,:),'b',x,ISR(2,:),'r',x,ISR(3,:),'g');
axis( [ 0, width, ymin, ymax ] )

percent=85;
IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
subplot(2,4,7);
plot(x,ISR(1,:),'b',x,ISR(2,:),'r',x,ISR(3,:),'g');
axis( [ 0, width, ymin, ymax ] )

percent=100;
IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
subplot(2,4,8);
plot(x,ISR(1,:),'b',x,ISR(2,:),'r',x,ISR(3,:),'g');
axis( [ 0, width, ymin, ymax ] )

%%%%%%%%%%%%%%%%%%%%%
if ff==1
figure('Name', 'FFT: 1 бит');
FISR1=fft(IR(line-1,:,color));
FISR1=fftshift(FISR1);
FISR1=abs(FISR1);
FISR2=fft(IR(line,:,color));
FISR2=fftshift(FISR2);
FISR2=abs(FISR2);
FISR3=fft(IR(line+1,:,color));
FISR3=fftshift(FISR3);
FISR3=abs(FISR3);
% subplot(2,4,1);
[a fx]=size(FISR1);
fx=1:fx;
% plot(fx,FISR1,'b',fx,FISR2,'r',fx,FISR3,'g');
plot(fx, FISR2);

figure
percent=5;
IMGS=writeStegoRnd(IMG,percent,1,10,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
FISR1=fft(ISR(1,:));
FISR1=fftshift(FISR1);
FISR1=abs(FISR1);
FISR2=fft(ISR(2,:));
FISR2=fftshift(FISR2);
FISR2=abs(FISR2);
FISR3=fft(ISR(3,:));
FISR3=fftshift(FISR3);
FISR3=abs(FISR3);
% subplot(2,4,2);
% plot(fx,FISR1,'b',fx,FISR2,'r',fx,FISR3,'g');
plot(fx, FISR2);

figure
percent=20;
IMGS=writeStegoRnd(IMG,percent,1,10,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
FISR1=fft(ISR(1,:));
FISR1=fftshift(FISR1);
FISR1=abs(FISR1);
FISR2=fft(ISR(2,:));
FISR2=fftshift(FISR2);
FISR2=abs(FISR2);
FISR3=fft(ISR(3,:));
FISR3=fftshift(FISR3);
FISR3=abs(FISR3);
% subplot(2,4,3);
% plot(fx,FISR1,'b',fx,FISR2,'r',fx,FISR3,'g');
plot(fx, FISR2);

figure
percent=30;
IMGS=writeStegoRnd(IMG,percent,1,10,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
FISR1=fft(ISR(1,:));
FISR1=fftshift(FISR1);
FISR1=abs(FISR1);
FISR2=fft(ISR(2,:));
FISR2=fftshift(FISR2);
FISR2=abs(FISR2);
FISR3=fft(ISR(3,:));
FISR3=fftshift(FISR3);
FISR3=abs(FISR3);
% subplot(2,4,4);
% plot(fx,FISR1,'b',fx,FISR2,'r',fx,FISR3,'g');
plot(fx, FISR2);

figure
percent=50;
IMGS=writeStegoRnd(IMG,percent,1,10,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
FISR1=fft(ISR(1,:));
FISR1=fftshift(FISR1);
FISR1=abs(FISR1);
FISR2=fft(ISR(2,:));
FISR2=fftshift(FISR2);
FISR2=abs(FISR2);
FISR3=fft(ISR(3,:));
FISR3=fftshift(FISR3);
FISR3=abs(FISR3);
% subplot(2,4,5);
% plot(fx,FISR1,'b',fx,FISR2,'r',fx,FISR3,'g');
plot(fx, FISR2);

figure
percent=70;
IMGS=writeStegoRnd(IMG,percent,1,10,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
FISR1=fft(ISR(1,:));
FISR1=fftshift(FISR1);
FISR1=abs(FISR1);
FISR2=fft(ISR(2,:));
FISR2=fftshift(FISR2);
FISR2=abs(FISR2);
FISR3=fft(ISR(3,:));
FISR3=fftshift(FISR3);
FISR3=abs(FISR3);
% subplot(2,4,6);
% plot(fx,FISR1,'b',fx,FISR2,'r',fx,FISR3,'g');
plot(fx, FISR2);

percent=85;
IMGS=writeStegoRnd(IMG,percent,1,10,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
FISR1=fft(ISR(1,:));
FISR1=fftshift(FISR1);
FISR1=abs(FISR1);
FISR2=fft(ISR(2,:));
FISR2=fftshift(FISR2);
FISR2=abs(FISR2);
FISR3=fft(ISR(3,:));
FISR3=fftshift(FISR3);
FISR3=abs(FISR3);
% subplot(2,4,7);
% plot(x,FISR1,'b',x,FISR2,'r',x,FISR3,'g');
plot(fx, FISR2);

percent=100;
IMGS=writeStegoRnd(IMG,percent,1,10,bitn,color);
ISR=get2DBitSignal(IMGS(:,:,1),bitn,line);
FISR1=fft(ISR(1,:));
FISR1=fftshift(FISR1);
FISR1=abs(FISR1);
FISR2=fft(ISR(2,:));
FISR2=fftshift(FISR2);
FISR2=abs(FISR2);
FISR3=fft(ISR(3,:));
FISR3=fftshift(FISR3);
FISR3=abs(FISR3);
% subplot(2,4,8);
% plot(fx,FISR1,'b',fx,FISR2,'r',fx,FISR3,'g');
plot(fx, FISR2);
end