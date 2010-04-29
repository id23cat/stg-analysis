function M=getBitMas(A)
%M=getBitMas(A)
%A - RGB map
%M - (8 x X*Y x 3)

[height,width,count]=size(A);
M=zeros(8,height*width,count);
prev=0;
for ic=1:count
	for ih=1:height
		for iw=1:width
			for ib=1:7
				bit=bitget(A(ih,iw,ic),ib);
				is=ih*width+iw;
				if bit==1
					M(ib,is,ic) = prev+1;
				elseif bit==0
					M(ib,is,ic) = prev-1;
				else
					exit(1);
				end			
				prev = M(ib,is,ic);
			end
		end
	end
end
        