function message = readStegoFromDCT(infile, mesfile)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

IMG=imread(infile);

% T = dctmtx(8);
% mdct = @(x)T * x * T';
mdct=@dct2;
imdct=@idct2;

% R=IMG(:,:,1);
% G=IMG(:,:,2);
B=double(IMG(:,:,3));

Bdct = blkproc(B,[8 8],mdct);
x1=4;
y1=5;
x2=5;
y2=4;

[h,w]=size(Bdct);

bi=1;
for i1=4:8:h-1 
	i2=i1+1;
	for j1=5:8:w
		j2=j1-1;
		C1=abs(Bdct(i1,j1));
		C2=abs(Bdct(i2,j2));
				
		if C1>C2, bmessage(bi)=0; end;
		if C1<C2, bmessage(bi)=1; end;		
		bi=bi+1;
	end 
end

message=char(fromBitVector(bmessage));
F=fopen(mesfile,'w');
fwrite(F,message);
fclose(F);

end

