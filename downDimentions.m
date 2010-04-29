function B=downDimentions(A, ind)
%A - [n-bits, X-size, Y-size]
%B - A(:, ind, :)

[b,x,y]=size(A);
B=zeros(b,y);
for i=1:b
	for j=1:y
		B(i,j) = A(i,ind,j);
	end
end