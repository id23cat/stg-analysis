function stegoBMP(fname, fmessage)
IMG=imread(fname);
fid=fopen(fmessage,'r');
tline = fgetl(fid);
[h,w,n]=size(IMG);
while ischar(tline)
    disp(tline)
	for i=1:size(tline)
		for j=1:8
			bit=bitget(tline(i),j);
			IMG(=bitset(
		end
	end
    tline = fgetl(fid);
end
fclose(fid)
