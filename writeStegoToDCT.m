function [bi, len, message] = writeStegoToDCT( infile, outfile, mesfile, P, percent)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% P=20; %порог

IMG=imread(infile);
IMGS=IMG;

F=fopen(mesfile);
message=fgets(F);
while feof(F)==0
	line=fgets(F);
	message=char(message,line);
end
fclose(F);

bmessage=toBitVector(message);

% T = dctmtx(8);
% mdct = @(x)T * x * T';
% imdct = @(x)T' * x * T;

mdct=@dct2;
imdct=@idct2;

% R=IMG(:,:,1);
% G=IMG(:,:,2);
% B=IMG(:,:,3);
B=double(IMG(:,:,3));
% B=im2double(IMG(:,:,3));

Bdct = blkproc(B,[8 8],mdct);
% Bold=Bdct;
% x1=4;
% y1=5;
% x2=5;
% y2=4;

[h,w]=size(Bdct);
len=length(bmessage);
if nargin==5
	%len=idivide(len*100,uint8(percent));
	x=idivide(h,int8(8));
	y=idivide(w,int8(8));
	cnt = double(x)*double(y);
	cnt=(cnt*percent)/100;
end

bi=1;
ci=0;
for i1=4:8:h-1 
	i2=i1+1;
	for j1=5:8:w
		j2=j1-1;
		
		if bi>=len
			break;
		end;
		if ci>=cnt
			break;
		end;
		
		C1=abs(Bdct(i1,j1));
		C2=abs(Bdct(i2,j2));
% 		disp(['-',num2str(C1),' ',num2str(C2)]);
% 		if Bdct(i+x1,j+y1)>=0,	z1=1; end;
% 		if Bdct(i+x1,j+y1)<0,	z1=-1; end;
% 		if Bdct(i+x2,j+y2)>=0,	z2=1; end;
% 		if Bdct(i+x2,j+y2)<0,	z2=-1; end;
		
		if Bdct(i1,j1)>=0,	z1=1; end;
		if Bdct(i1,j1)<0,	z1=-1; end;
		if Bdct(i2,j2)>=0,	z2=1; end;
		if Bdct(i2,j2)<0,	z2=-1; end;
		
		if ((C1-C2)<=P) && (bmessage(bi)==0)
			C1=P+C2+1;
		end
		if ((C1-C2)>=-P) && (bmessage(bi)==1)
			C2=P+C1+1;
		end
		
% 		disp(['+',num2str(C1),' ',num2str(C2)]);
		
% 		Bdct(i+x1,j+y1)=z1*C1;
% 		Bdct(i+x2,j+y2)=z2*C2;
		Bdct(i1,j1)=z1*C1;
		Bdct(i2,j2)=z2*C2;
		
		
		
		C1=abs(Bdct(i1,j1));
		C2=abs(Bdct(i2,j2));
				
		if C1>C2, bmessage(bi)=0; end;
		if C1<C2, bmessage(bi)=1; end;
		
		bi=bi+1;
		ci=ci+1;
	end 
end

% Bd=Bdct-Bold;

% bi=1;
% for i1=4:8:h-1 
% 	i2=i1+1;
% 	for j1=5:8:w
% 		j2=j1-1;
% 		C1=abs(Bdct(i1,j1));
% 		C2=abs(Bdct(i2,j2));
% 				
% 		if C1>C2, bmessage(bi)=0; end;
% 		if C1<C2, bmessage(bi)=1; end;		
% 		bi=bi+1;
% 	end 
% end

message=char(fromBitVector(bmessage));
% proc=@(x)x(4,5)-x(5,4);
% message=blkproc(Bdct,[8 8],proc);

B = blkproc(Bdct,[8 8],imdct);
B = uint8(B);
IMGS(:,:,3)=B;

imwrite(IMGS,outfile);
end
