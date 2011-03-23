function V = toBitVector( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

A=uint8(A);
[h,w]=size(A);
V=zeros(1,h*w*8);
for i=1:h
	for j=1:w
		for k=1:8
		V((i-1)*w+(j-1)*8+k)=bitget(A(i,j),9-k);
		end;
	end
end

