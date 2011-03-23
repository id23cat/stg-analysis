% srcfile='./BMP/office_3.bmp';
% dstfile='./BMP/office_3dct.bmp';
srcfile='./BMP/05.bmp';
dstfile='./BMP/05dct.bmp';
% srcfile='./BMP/4.bmp';
% dstfile='./BMP/4dct.bmp';
% srcfile='./BMP/1.bmp';
% dstfile='./BMP/1dct.bmp';
msfile='./BMP/message2.txt';
mdfile='./BMP/message2-out.txt';
P=30;
percent=50;
part=5;

writeStegoToDCT(srcfile,dstfile,msfile,P,percent);
% writeStegoToDCT(srcfile,dstfile,msfile,P);
readStegoFromDCT(dstfile,mdfile)

IMGs=imread(dstfile);
Rs=IMGs(:,:,1);
Gs=IMGs(:,:,2);
Bs=IMGs(:,:,3);

IMG=imread(srcfile);
R=IMG(:,:,1);
G=IMG(:,:,2);
B=IMG(:,:,3);


% 	posM = [1   2   6   7   15  16  28  29
% 			3   5   8   14  17  27  30  43
% 			4   9   13  18  26  31  42  44
% 			10  12  19  25  32  41  45  54
% 			11  20  24  33  40  46  53  55
% 			21  23  34  39  47  52  56  61
% 			22  35  38  48  51  57  60  62
% 			36  37  49  50  58  59  63  64];
% 	posV = [1	1;	1	2;	2	1;	3	1;	% 4
% 			2	2;	1	3;	1	4;	2	3;	% 8
% 			3	2;	4	1;	5	1;	4	2;	% 12
% 			3	3;	2	4;	1	5;	1	6;	% 16
% 			2	5;	3	4;	4	3;	5	2;	% 20
% 			6	1;	7	1;	6	2;	5	3;	% 24
% 			4	4;	3	5;	2	6;	1	7;	% 28
% 			1	8;	2	7;	3	6;	4	5;	% 32
% 			5	4;	6	3;	7	2;	8	1;	% 36
% 			8	2;	7	3;	6	4;	5	5;	% 40
% 			4	6;	3	7;	2	8;	3	8;	% 44
% 			4	7;	5	6;	6	5;	7	4;	% 48
% 			8	3;	8	4;	7	5;	6	6;	% 52
% 			5	7;	4	8;	5	8;	6	7;	% 56
% 			7	6;	8	5;	8	6;	7	7;	% 60
% 			6	8;	7	8;	8	7;	8	8;];% 64
% 
% % T = dctmtx(8);
% % mdct = @(x)T * x * T';
% % imdct = @(x)T' * x * T;
% mdct=@dct2;
% imdct=@idct2;
% 
% 
% Bdcts = blkproc(double(Bs),[8 8],mdct);
% % for j=1:64
% % 	Cvs(j,:)=GetDCTCoefficientsVec(Bs,j);
% % end
% 
% 
% 
% % T = dctmtx(8);
% % mdct = @(x)T * x * T';
% % % imdct = @(x)T' * x * T;
% 
% Bdct = blkproc(double(B),[8 8],mdct);
% % for j=1:64
% % 	Cv(j,:)=GetDCTCoefficientsVec(B,j);
% % end
% 
% Dstd=blkproc(Bdct,[8 8],@stdDiag);
% Dstds=blkproc(Bdcts,[8 8],@stdDiag);


P=DiagDCTtest(B,part);
Ps=DiagDCTtest(Bs,part);
x=1:part;
figure,plot(x,P,'r*-',x,Ps,'gx--');
