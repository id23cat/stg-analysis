function BitSig = get2DBitSignal(A, ib, line)
%A - X-size, Y-size, x3
%B - X-size, Y-size, N-bits

%(BXY)

if nargin==1
	[height, width] = size(A);
	BitSig = zeros(height, width, 8);
	
	for ib=1:8
		for ih=1:height
			prev=0;
			for iw=1:width
				bit = bitget(A(ih,iw), ib);
				if bit==1
					BitSig(ih,iw,ib) = (prev+prev+1)/2;
				elseif bit==0
					BitSig(ih,iw,ib) = (prev+prev-1)/2;
				else
					exit('Error');
				end
				prev=BitSig(ih,iw,ib);
			end
			% 		V=A(ih,:);
			% 		BitSig(ib,ih,:) = getBitSignal(0,V,ib);
		end
	end
elseif nargin==2
	[height, width] = size(A);
	BitSig = zeros(height, width);
	for ih=1:height
		prev=0;
		for iw=1:width
			bit = bitget(A(ih,iw), ib);
			if bit==1
				BitSig(ih,iw) = prev+1;
			elseif bit==0
				BitSig(ih,iw) = prev-1;
			else
				exit('Error');
			end
			prev=BitSig(ih,iw);
		end
		% 		V=A(ih,:);
		% 		BitSig(ib,ih,:) = getBitSignal(0,V,ib);
	end
elseif nargin==3
	[height, width] = size(A);
	BitSig = zeros(3, width);
		prev1=0;
		prev2=0;
		prev3=0;
		for iw=1:width
			bit = bitget(A(line-1,iw), ib);
			if bit==1
				BitSig(1,iw) = prev1+1;
			elseif bit==0
				BitSig(1,iw) = prev1-1;
			else
				exit('Error');
			end
			prev1=BitSig(1,iw);
			
			bit = bitget(A(line,iw), ib);
			if bit==1
				BitSig(2,iw) = prev2+1;
			elseif bit==0
				BitSig(2,iw) = prev2-1;
			else
				exit('Error');
			end
			prev2=BitSig(2,iw);
			
			bit = bitget(A(line+1,iw), ib);
			if bit==1
				BitSig(3,iw) = prev3+1;
			elseif bit==0
				BitSig(3,iw) = prev3-1;
			else
				exit('Error');
			end
			prev3=BitSig(3,iw);
		end
		% 		V=A(ih,:);
		% 		BitSig(ib,ih,:) = getBitSignal(0,V,ib);
	
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