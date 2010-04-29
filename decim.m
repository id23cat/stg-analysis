function B = decim(A,r)
len = int32(length(A)/r);
B = zeros(1,len);
for i=0:len-1
	B(i+1)=A(r*i+1);
end
	