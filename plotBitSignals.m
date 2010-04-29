function plotBitSignals(A,str, line,neighbors,ymin,ymax,bitn)
% ymin=-20;
% ymax=20;
% ymin=min([ymin min(A(line,:,1)) min(A(line,:,2)) min(A(line,:,3))]);
% ymax=max([ymax max(A(line,:,1)) max(A(line,:,2)) max(A(line,:,3))]);

if nargin==3
	[h,w,bytelen] = size(A);
	x=1:w;
	figure('Name',str);	
	for i=1:bytelen
		subplot(2,4,i);
		ylabel(i);
		plot(x,A(line,:,i),'b');
	end
elseif neighbors==1
	[h,w,bytelen] = size(A);
	x=1:w;
	figure('Name',str);	
	for i=1:bytelen
		subplot(2,4,i);
		ylabel(i);
		if line==1
			plot(x,A(line,:,i),'b',x,A(line+1,:,i),'g');
		else
			plot(x,A(line,:,i),'b',x,A(line-1,:,i),'r',x,A(line+1,:,i),'g');
			if i==bitn				
				axis( [ 0, w, ymin, ymax ] )
			end
		end
			
	end
else
	[len,bytelen] = size(A);
	x=1:len;
	figure('Name',str);	
	ylabel(1);
	for i=1:bytelen
		subplot(2,4,i);
		ylabel(i);
		plot(x,A(i,:),'b');
	end
end
	
% subplot(2,4,1);
% plot(x,A(1,:));
% subplot(2,4,2);
% plot(x,A(3,:));
% subplot(2,4,3);
% plot(x,A(5,:));
% subplot(2,4,4);
% plot(x,A(7,:));
% 
% subplot(2,4,5);
% plot(x,A(2,:));
% subplot(2,4,6);
% plot(x,A(4,:));
% subplot(2,4,7);
% plot(x,A(6,:));
% subplot(2,4,8);
% plot(x,A(8,:));