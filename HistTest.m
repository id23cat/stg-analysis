function [ P ] = HistTest( V )
%function [ P ] = HistTest( V )
% возвращает вероятность нахождения в векторе V стего, анализируя гистограмму
% распределения значений:
% max(hist)<0.95 -> P=0
% max(hist)>0.95 -> P=1

x=0:0.01:10;
hc=histc(V,x);
 figure, hist(V,100);

[m,i]=max(hc);

imax=x(i);

if imax<0.95
	P=0;
elseif imax>0.95
	P=1;
end
end

