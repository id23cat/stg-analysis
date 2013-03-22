d='Images2/C-all/';
% d='Images3/70/';
files=dir([d, '*.log']);
files0=dir([d, '*-0-A*.log']);
files1=dir([d, '*-1-Y*.log']);
files2=dir([d, '*-2-Y*.log']);
files3=dir([d, '*-3-Y*.log']);
files5=dir([d, '*-5-Y*.log']);
files125=dir([d, '*25-1-Y-0.log']);
files150=dir([d, '*50-1-Y-0.log']);
files175=dir([d, '*75-1-Y-0.log']);
files1100=dir([d, '*100-1-A-0.log']);
files1100Y=dir([d, '*100-1-Y-0.log']);
files1100B=dir([d, '*100-1-B-0.log']);
files1100R=dir([d, '*100-1-R-0.log']);
files225=dir([d, '*25-2-Y-0.log']);
files250=dir([d, '*50-2-Y-0.log']);
files275=dir([d, '*75-2-Y-0.log']);
files2100=dir([d, '*100-2-Y-0.log']);
files2100Y=dir([d, '*100-2-Y-0.log']);
files325=dir([d, '*25-3-Y-0.log']);
files350=dir([d, '*50-3-Y-0.log']);
files375=dir([d, '*75-3-Y-0.log']);
files3100=dir([d, '*100-3-Y-0.log']);
files525=dir([d, '*25-5-Y-0.log']);
files550=dir([d, '*50-5-Y-0.log']);
files575=dir([d, '*75-5-Y-0.log']);
files5100=dir([d, '*100-5-Y-0.log']);



disp(d);
errtype=0;
fprintf('etype=%d\n', errtype);
x=0.354;

global TESTALLKOCH_xg_max TESTALLKOCH_Hg_max TESTALLKOCH_MPT_max
TESTALLKOCH_xg_max=[]; TESTALLKOCH_Hg_max=[]; TESTALLKOCH_MPT_max=[];
% MPT=15:30;


% F=files0;
% fprintf('Files count=%d\n',length(F));
for maxPercent=18
	component=0;
% % 	figure
% % 	F=files0(randi(length(files0),1,100));
% 	F=files0;
% 	fprintf('Files count=%d\n',length(F));
% 	[err e1t e2t]=testAllKoch(x,maxPercent,component,F,d,errtype, 1,'o-');
% 	fprintf('===========================================================\n');
% 	fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f, e0=%3.4f\n', F(1).name, component,x, e1t, e2t, err);
% 	fprintf('===========================================================\n');
	
% 	pause;
% 	F=files1100Y(randi(length(files1100Y),1,100));
 	F=files1100;
% 	F=files1100B;
	fprintf('Files count=%d\n',length(F));
	[err e1t e2t]=testAllKoch(x,maxPercent,component,F,d,errtype, 1,'x--');
	fprintf('===========================================================\n');
	fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f, e0=%3.4f\n', F(1).name, component,x, e1t, e2t, err);
	fprintf('===========================================================\n');
	pause
% 	
	
% 	component=2;
% % 	figure
% % 	F=files0(randi(length(files0),1,100));
% 	F=files0;
% 	fprintf('Files count=%d\n',length(F));
% 	[err e1t e2t]=testAllKoch(x,maxPercent,component,F,d,errtype, 1,'o-');
% 	fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f, e0=%3.4f\n', F(1).name, component,x, e1t, e2t, err);
	
% 	pause;
% 	F=files1100Y(randi(length(files1100Y),1,100));
%  	F=files1100Y;
	F=files2100;
	fprintf('Files count=%d\n',length(F));
	[err e1t e2t]=testAllKoch(x,maxPercent,component,F,d,errtype, 1,'x--');
	fprintf('===========================================================\n');
	fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f, e0=%3.4f\n', F(1).name, component,x, e1t, e2t, err);
	fprintf('===========================================================\n');
	
	
% % 	component=3;
% % 	figure
% % 	F=files0(randi(length(files0),1,100));
% 	F=files0;
% 	fprintf('Files count=%d\n',length(F));
% 	[err e1t e2t]=testAllKoch(x,maxPercent,component,F,d,errtype, 1,'o-');
% 	fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f, e0=%3.4f\n', F(1).name, component,x, e1t, e2t, err);
	
% 	pause;
% 	F=files1100Y(randi(length(files1100Y),1,100));
%  	F=files1100Y;
	F=files3100;
	fprintf('Files count=%d\n',length(F));
	[err e1t e2t]=testAllKoch(x,maxPercent,component,F,d,errtype, 1,'x--');
	fprintf('===========================================================\n');
	fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f, e0=%3.4f\n', F(1).name, component,x, e1t, e2t, err);
	fprintf('===========================================================\n');
end


% for maxPercent=18.7:0.1:18.9
% 	[err e1t e2t]=testAllKoch(x,maxPercent,component,F,d,errtype);
% 	fprintf('%s, %d, x=%3.4f: e1=%3.4f, e2=%3.4f, e0=%3.4f\n', F(1).name, component,x, e1t, e2t, err);
% end

