function B=changeBitHeight(A)
%A - [n-bits, X-size, Y-size]
%B - [X-size, n-bits, Y-size]

[b,x,y]=size(A);
B=zeros(x,b,y);
for i=1:b
	for j=1:x
		%for k=1:y
			B(j,i,:) = A(i,j,:);
		%end
	end
end