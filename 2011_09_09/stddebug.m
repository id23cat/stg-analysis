function [ val ] = stddebug( X )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

disp(X)
val = std(X);
mn = mean(X);
fprintf('mean = %f\n', mn);
dev = 0;
for i=1:length(X)
	d = X(i) - mn;
	fprintf('d = %f\n',d);
	dev = dev + d^2;
	fprintf('dev = %f\n',dev)	
end
val = sqrt(dev/(length(X)-1));
fprintf('std = %f\n', val);
end

