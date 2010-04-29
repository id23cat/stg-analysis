function [BitSignal, prev] = getBitSignal(init, A, bpos)
%[BitSignal, prev] = getBitSignal(init, A, bpos)
% init - init value
%A -- 1D array
%bpos -- bit position
%BitSignal -- vector
%prev -- 

[w,len] = size(A);
BitSignal = zeros(len);
prev = init;
for il=1:len
	bit=bitget(A(il),bpos);
	if bit==1
		BitSignal(il) = prev+1;
		elseif bit==0
			BitSignal(il) = prev-1;
		else
			exit('Error');
	end
	prev = BitSignal(il);
end
end
		
% [height,width]=size(A);
% BitSignal=zeros(8,height*width);
% 
% for ib=1:8
% 	prev=0;
% 	for ih=1:height
% 		for iw=1:width
% 			%byte = ;
% 			bit=bitget(A(ih,iw),ib);
% 			is=(ih-1)*width+iw;
% 			if bit==1
% 				BitSignal(ib,is) = prev+1;
% 			elseif bit==0
% 				BitSignal(ib,is) = prev-1;
% 			else
% 				exit('Error');
% 			end			
% 			prev = BitSignal(ib,is);
% 		end
% 	end
% end

        