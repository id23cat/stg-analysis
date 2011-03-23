function V = fromBitVector( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

A=uint8(A);
V=zeros(1,uint32(length(A)/8)-1);
len=length(V);
for i=1:len
	for k=1:8		
		bit=A((i-1)*8+k);
		bi=9-k;
		V(i)=bitset(V(i),bi,bit);
	end;	
end