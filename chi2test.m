function P=chi2test(V)

[height,width]=size(V);
P=zeros(1,height);
for i=1:4:height	
	for m=0:3
	mn=min(V(i+m,:));
	mx=max(V(i+m,:));
	x=mn:mx;
	y=histc(V(i+m,:),x);
	k = uint32(length(y)/2)-1;
	n=zeros(1,k);
	nt=zeros(1,k);
	X2 = zeros(1,k);
	for j=1:k
		j2=j*2;
		n=y(1,j2);
		nt=(y(1,j2)+y(1,j2+1))/2;
		X2(j)=(n-nt)^2/nt;
		if(isnan(X2(j)))
			X2(j)=0;
		end
	end
	X2=nonzeros(X2)';
	x2=double(sum(X2));
	k=length(X2);
	end
	P(i)=chi2cdf(x2,k-1);
	P=nonzeros(P)';
end