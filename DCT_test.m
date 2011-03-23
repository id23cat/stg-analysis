IMG=imread('./BMP/5.bmp');
% IMG = imread('cameraman.tif');
%  IMG = rgb2gray(IMG);
IMGS=IMG;
IMG2=IMG;
IMGS2=IMG;
[height, width, cols]=size(IMG);

bitn=1;
line = 2;
% line =  round(height/2);
lfirst = 1;
llast = height;
percent=90;
mul=8;
bits=5;
nco=64;

% color=1;
% 
% color=2;
% IMGS=writeStegoRnd(IMGS,percent,lfirst,llast,bitn,color);
% color=3;
% IMGS=writeStegoRnd(IMGS,percent,lfirst,llast,bitn,color);

T = dctmtx(8);
mdct = @(x)T * x * T';
invmdct = @(x)T' * x * T;

% dct = @dct2;
% invdct = @idct2;


	mask = [1   1   1   1   1   1   1   1
			1   0   0   0   0   0   0   0
			1   0   0   0   0   0   0   0
			1   0   0   0   0   0   0   0
			1   0   0   0   0   0   0   0
			1   0   0   0   0   0   0   0
			1   0   0   0   0   0   0   0
			1   0   0   0   0   0   0   0];
		
	posM = [1   2   6   7   15  16  28  29
			3   5   8   14  17  27  30  43
			4   9   13  18  26  31  42  44
			10  12  19  25  32  41  45  54
			11  20  24  33  40  46  53  55
			21  23  34  39  47  52  56  61
			22  35  38  48  51  57  60  62
			36  37  49  50  58  59  63  64];
	
	
COEF1 = zeros(64, uint16(height*width/64),cols);
% IMGY=IMG.*mul;
IMGY=bitshift(IMG,bits);
% IMGY=rgb2ycbcr(IMGY);
for i=1:cols
	
 	I=IMGY(:,:,i);
	
	I=bitget(I,1);
% 	I = im2double(I);
	I=double(I);
	
	
	B = blkproc(I,[8 8],mdct);
	for j=1:64
		COEF1(j,:,i)=GetDCTCoefficientsVec(B,j);
	end
	

% 	icor=1
% 	for j=1:8:height-8)
% 		for k=1:8:width-16
% 			sB1=B(j:j+7,k:k+7);
% 			sB2=B(j:j+7,k+9:k+15);
% 			corrs(icor)=xcorr2
% 		end
% 	end
		
	B2 = blkproc(B,[8 8],@(x)mask.* x);	

% 	 I2 = blkproc(B2,[8 8],invdct);
	 I2 = blkproc(B,[8 8],invmdct);
	 IMG2(:,:,i) = im2uint8(I2);
end

bitstd=nlfilter(double(COEF1(nco,:,1)),[1 20],@std);
x=1:length(bitstd);
cdct=dct(bitstd);
i=length(cdct);
stdmdct=blkproc(double(cdct(2:i)),[1 10],@std);
y=1:length(stdmdct);
% meanstdmdc=blkproc(stdmdct,[1 10],@mean);
% z=1:length(meanstdmdc);
% IMG2=ycbcr2rgb(IMG2);
% imshow(IMG), figure, imshow(IMG2)
% figure 
% hist(B), colorbar

% Встраивание сообщения

COEF2 = zeros(64, uint16(height*width/64),cols);
% Stego
% IMG=writeStegoRnd(IMG,percent,1,width-1,1);
message=genRndMessage(uint32(height*width*cols/8));
IMGS=writeStego(IMG,message);
% IMGY=IMGS.*mul;
IMGSY=bitshift(IMGS,bits);
% IMGSY=rgb2ycbcr(IMGSY);
for i=1:cols
	%IMGS=writeStegoRnd(IMG,percent,lfirst,llast,bitn,i);
 	I=IMGSY(:,:,i);
	
	I=bitget(I,1);
% 	I = im2double(I);
	I=double(I);
	
	
	B = blkproc(I,[8 8],mdct);
	for j=1:64
		COEF2(j,:,i)=GetDCTCoefficientsVec(B,j);
	end
	
	
% 	icor=1
% 	for j=1:8:height-8)
% 		for k=1:8:width-16
% 			sB1=B(j:j+7,k:k+7);
% 			sB2=B(j:j+7,k+9:k+15);
% 			corrs(icor)=xcorr2
% 		end
% 	end
		
	B2 = blkproc(B,[8 8],@(x)mask.* x);	

% 	 I2 = blkproc(B2,[8 8],invdct);
	 I2 = blkproc(B,[8 8],invmdct);
	 IMGS2(:,:,i) = im2uint8(I2);
end

bitstd2=nlfilter(double(COEF2(nco,:,1)),[1 20],@std);
x2=1:length(bitstd2);
cdct2=dct(bitstd2);
i=length(cdct2);
stdmdct2=blkproc(double(cdct2(2:i)),[1 10],@std);
y2=1:length(stdmdct2);
% meanstdmdc2=blkproc(stdmdct2,[1 10],@mean);
% z=1:length(meanstdmdc);


figure, plot(x,bitstd,'r',x2,bitstd2,'g');
figure, plot(x,cdct,'r',x2,cdct2,'g');
figure, plot(y,stdmdct,'r',y2,stdmdct2,'g');
% figure, plot(z,meanstdmdc,'r',z2,meanstdmdc2,'g');








% IMG2=ycbcr2rgb(IMGS2);
% figure, imshow(IMGS2)
% YCBCR=rgb2ycbcr(IMGS2);
% figure, imshow(IMG2(:,:,1))
% figure, imshow(IMG2(:,:,2))
% figure, imshow(IMG2(:,:,3))
% figure, imshow(YCBCR(:,:,1))
% figure, imshow(YCBCR(:,:,2))
% figure, imshow(YCBCR(:,:,3))

