function BitSig = get1DBitSignal(A)
%BitSig = get1DBitSignal(A)
%A -- 2D massive

[height, width] = size(A);
BitSig = zeros(8, height*width);
for ib=1:8
	prev = 0;
	for ih=1:height
		for iw=1:width
			bit = bitget(A(ih,iw), ib);
			if bit==1
				BitSig(ib,(ih-1)*width+iw) = prev+1;
			elseif bit==0
				BitSig(ib,(ih-1)*width+iw) = prev-1;
			else
				exit('Error');
			end
			prev=BitSig(ib,(ih-1)*width+iw);
% 			V = A(ih,:);
% 			[BitSig(ib,(ih-1)*width+1:height*width), prev] = getBitSignal(prev,V,ib);
		end
	end
end
end


% function [S1,S2,S3,S4,S5,S6,S7,S8]=generateSignal(A)
% %[S1,S2,S3,S4,S5,S6,S7,S8]=generateSignal(A)
% %M=generateSignal(A)
% [signals,length,count]=size(A);
% if nargout==1;
% 	M=zeros(size(A));
% 	prev=0;
% 	for ic=1:count
% 		for is=1:signals
% 			for il=1:length
% 				if A(is,il,ic)==1
% 					M(is,il,ic)=prev+1;
% 				else
% 					M(is,il,ic)=prev-1;
% 				end
% 				prev=M(is,il,ic);
% 			end
% 		end
% 	end
% elseif nargout==8
% 
% function =generateMSignal(A)
% [signals,length,count]=size(A);
% M=zeros(size(A));
% prev=0;
% for ic=1:count
% 	for is=1:signals
% 		for il=1:length
% 			if A(is,il,ic)==1
% 				M(is,il,ic)=prev+1;
% 			else
% 				M(is,il,ic)=prev-1;
% 			end
% 			prev=M(is,il,ic);
% 		end
% 	end
% end