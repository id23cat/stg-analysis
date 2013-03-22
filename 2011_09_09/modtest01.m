% function [ output_args ] = test2( input_args )
%   Detailed explanation goes here
d='Images2/C-all/';
files=dir([d, '*.log']);
files0=dir([d, '*-0-A*.log']);
files1=dir([d, '*-1-Y*.log']);
files2=dir([d, '*-2-Y*.log']);
files3=dir([d, '*-3-Y*.log']);
files5=dir([d, '*-5-Y*.log']);
files125=dir([d, '*25-1-A-0.log']);
files150=dir([d, '*50-1-A-0.log']);
files175=dir([d, '*75-1-A-0.log']);
files1100=dir([d, '*100-1-A-0.log']);
files225=dir([d, '*25-2-A-0.log']);
files250=dir([d, '*50-2-A-0.log']);
files275=dir([d, '*75-2-A-0.log']);
files2100=dir([d, '*100-2-A-0.log']);
files325=dir([d, '*25-3-A-0.log']);
files350=dir([d, '*50-3-A-0.log']);
files375=dir([d, '*75-3-A-0.log']);
files3100=dir([d, '*100-3-A-0.log']);
files525=dir([d, '*25-5-A-0.log']);
files550=dir([d, '*50-5-A-0.log']);
files575=dir([d, '*75-5-A-0.log']);
files5100=dir([d, '*100-5-A-0.log']);

component=3;
x=0.354;

% x=0.6473;

iterations=5;
disp(d);
% divi=19.4428;
e1=0;
e2=0;



for i=1:iterations
	files00=files0(randi(length(files0),1,100));
	F=files00;		
	[err e1t e2t]=testAllKoch(x,component,F,d,0);
	e1=e1+e1t;
	e2=e2+e2t;
end
fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f\n\n', F(1).name, component,x, e1/iterations,e2/iterations);
% pause


e1=0;
e2=0;
for i=1:iterations
	files11=files1100(randi(length(files1100),1,100));
	F=files11;
	[err e1t e2t]=testAllKoch(x,component,F,d,0);
	e1=e1+e1t;
	e2=e2+e2t;
end
fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f\n\n', F(1).name, component,x, e1/iterations,e2/iterations);
% pause


e1=0;
e2=0;
for i=1:iterations
	files22=files2100(randi(length(files2100),1,100));
	F=files22;
	[err e1t e2t]=testAllKoch(x,component,F,d,0);
	e1=e1+e1t;
	e2=e2+e2t;
end
fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f\n\n', F(1).name, component,x, e1/iterations,e2/iterations);
% pause


e1=0;
e2=0;
for i=1:iterations
	files33=files3100(randi(length(files3100),1,100));
	F=files33;
	[err e1t e2t]=testAllKoch(x,component,F,d,0);
	e1=e1+e1t;
	e2=e2+e2t;
end
fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f\n\n', F(1).name, component,x, e1/iterations,e2/iterations);
% pause


e1=0;
e2=0;
for i=1:iterations
	files55=files5100(randi(length(files5100),1,100));
	F=files55;
	[err e1t e2t]=testAllKoch(x,component,F,d,0);
	e1=e1+e1t;
	e2=e2+e2t;
end
fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f\n\n', F(1).name, component,x, e1/iterations,e2/iterations);




