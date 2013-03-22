function [ Hdiff ] = histDiff( C )
%histDiff( C )
%   Detailed explanation goes here

% mi=min(min(C));
ma=max(abs(C));
x=-ma:ma;

H=histc(C,x);
Hdiff=zeros(1,ma-1);
for i=1:ma-1
	Hdiff(i)=std([H(x==-i) H(x==i)]);
end
end

