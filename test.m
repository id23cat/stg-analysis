figure
plot(x,I2(line,:,1),'b',x,IS2(line,:,1),'b:',x,I2(line,:,2),'r',x,I2(line,:,3),'g',x,I2(line,:,4),'m',x,I2(line,:,5),'y',x,I2(line,:,6),'c',x,I2(line,:,7),'k',x,I2(line,:,8),'r:')
legend('1','1s','2','3','4','5','6','7','8')

% figure
% plot(x,IS2(line,:,1),'b',x,IS2(line,:,2),'r',x,IS2(line,:,3),'g',x,IS2(line,:,4),'m',x,IS2(line,:,5),'y',x,IS2(line,:,6),'c',x,IS2(line,:,7),'k',x,IS2(line,:,8),'r:')
% legend('1','2','3','4','5','6','7','8')

disp max
MAX = zeros(2,8);
MIN = zeros(2,8);
for i=1:8
	MAX(1,i)=max(I2(line,:,i));
	MIN(1,i)=min(I2(line,:,i));
	MAX(2,i)=max(IS2(line,:,i));
	MIN(2,i)=min(IS2(line,:,i));
end



% Децимация сигнала
% line = 188;
% k=1;
% neib=1;
% pltf=1;
% r=6;
% len=int32(width/r);
% 
% I2=double(I2);
% DeI2=zeros(3,len-1,bits);
% for i=line-1:line+1
% 	for j=1:bits
% 		DeI2(k,:,j)=decimate(I2(i,:,j),r);		
% 	end
% 	k=k+1;
% end
% 
% 
% % Производная от сигнала
% DI2=zeros(3,len-1,bits);
% disp 'Diff 1:'
% for i=1:3
% 	for j=1:bits
% 		DI2(i,:,j)=diff(DeI2(i,:,j));		
% 	end
% end
% disp 'yes'
% 
% line = 2;
% 
% t=[1:len-1];
% figure;
% plot(t,DI2(line,:,bitn),'b');
% figure;
% plot(t,DI2(line-1,:,bitn),'r');
% figure;
% plot(t,DI2(line+1,:,bitn),'g');
% 
% % if(pltf)
% % 	if neib
% % 		plotBitSignals(DI2,'Производная исходного сигнала',line,1);				% 2
% % 	else
% % 		plotBitSignals(DI2,'Производная исходного сигнала',line);				% 2
% % 	end
% % 	figure
% % 	title('Производная исходного сигнала');
% % 	if neib
% % 		plot(x,DI2(line,:,bitn),'b',x,DI2(line-1,:,bitn),'r',x,DI2(line+1,:,bitn),'g');
% % 	else
% % 		plot(x,DI2(line,:,bitn),'b');
% % 	end
% % end