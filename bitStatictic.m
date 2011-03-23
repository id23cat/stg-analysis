

windlen1 = 20; % length of first std window
windlen2 = 50; % length of second std window

% prepare encrypted message
[F,mes]=fopen('./BMP/message1.txt', 'rt');
message='';
while feof(F)==0
	line=fgetl(F);
	message=char(message,line);
end
fclose(F);
[i,j]=size(message);
message=reshape(message',1,i*j);
message=message(65:i*j);
meaasge=message(1:40);
m=uint8(message);
mbit=toBitVector(m);
bitstd=nlfilter(double(mbit),[1 windlen1],@std);
x=1:length(bitstd);
mdct=dct(bitstd);
i=length(mdct);
stdmdct=blkproc(double(mdct(2:i)),[1 windlen2],@std);
y=1:length(stdmdct);
meanstdmdc=blkproc(stdmdct,[1 10],@mean);
z=1:length(meanstdmdc);
%finish preparing


% prepare random message
mbit2=randint(1,length(mbit),[0 1]);
bitstd2=nlfilter(double(mbit2),[1 windlen1],@std);
x2=1:length(bitstd2);
mdct2=dct(bitstd2);
i=length(mdct2);
stdmdct2=blkproc(double(mdct2(2:i)),[1 windlen2],@std);
y2=1:length(stdmdct2);
meanstdmdc2=blkproc(stdmdct2,[1 10],@mean);
z2=1:length(meanstdmdc2);
% finish preparing random message






% prepare image bits
% IMG=imread('./BMP/5.bmp');
% IMG=imread('cameraman.tif');
% IMG=imread('football.jpg');
% IMG=imread('forest.tif');
IMG=imread('greens.jpg');
% B=bitget(IMG(:,:,1),1);
% Bs=bitget(IMGS(:,:,1),1);
img3=bitget(IMG(:,:,1),1);
[i,j]=size(img3);
imgv3=reshape(img3',1,i*j);
imgv3=imgv3(1:length(bitstd));
bitstd3=nlfilter(double(imgv3),[1 windlen1],@std);
x3=1:length(bitstd3);
mdct3=dct(bitstd3);
i=length(mdct3);
stdmdct3=blkproc(double(mdct3(2:i)),[1 windlen2],@std);
y3=1:length(stdmdct3);
meanstdmdc3=blkproc(stdmdct3,[1 10],@mean);
z3=1:length(meanstdmdc3);
% finish preparing image bits


[h,w,c]=size(IMG);
IMGS=writeStego(IMG(:,:,1),message);
img4=bitget(IMGS,1);
[i,j]=size(img4);
imgv4=reshape(img4',1,i*j);
imgv4=imgv4(1:length(bitstd));
bitstd4=nlfilter(double(imgv4),[1 windlen1],@std);
x4=1:length(bitstd4);
mdct4=dct(bitstd4);
i=length(mdct4);
stdmdct4=blkproc(double(mdct4(2:i)),[1 windlen2],@std);
y4=1:length(stdmdct4);

meanstdmdc4=blkproc(stdmdct4,[1 10],@mean);
z4=1:length(meanstdmdc4);

% figure, plot(x,bitstd);
figure, plot(x,bitstd,'r',x2,bitstd2,'g',x3,bitstd3,'b',x4,bitstd4,'k');
figure, plot(x,mdct,'r',x2,mdct2,'g',x3,mdct3,'b',x4,mdct4,'k');
figure, plot(y,stdmdct,'r',y2,stdmdct2,'g',y3,stdmdct3,'b',y4,stdmdct4,'k');
figure, plot(z,meanstdmdc,'r',z2,meanstdmdc2,'g',z3,meanstdmdc3,'b',z4,meanstdmdc4,'k');

% img3(1:10)
% imgv3(1:10)
% img3(1,1:10)
% figure, plot(x,bitstd,'r',x2,bitstd2,'g',x3,bitstd3,'b');
% x3=1:length(bitstd3(1:77536));
% figure, plot(x,bitstd,'r',x2,bitstd2,'g',x3,bitstd3,'b');
% bitstd3=nlfilter(double(imgv3(1:77536)),[1 20],@std);
% x3=1:length(bitstd3);
% figure, plot(x,bitstd,'r',x2,bitstd2,'g',x3,bitstd3,'b');
% x2,bitstd2,'g',
% figure, plot(x,bitstd,'r',x2,bitstd2,'g',x3,bitstd3,'b');
