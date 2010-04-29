function A=writeStegoRnd(A,percent,line1,line2,nbit, color)

[height, width, rgb] = size(A);
mlen=round(((line2-line1+1)*width/8)*percent/100)-1;
Message = genRndMessage(mlen);

defaultStream = RandStream.getDefaultStream;
defaultStream.reset;
indlen1 = (line1-1)*width+1;
indlen2 = (line2)*width;
rIndex=randIndex(indlen1,indlen2);
ri=1;
for i=1:mlen		% длинна сообщения + 4 бита длинны
	for j=1:8		% 8 бит
		bit = bitget(Message(i), j);	%запись сообщения					
		rindx=rIndex(ri);
		ri=ri+1;
		xpos=idivide(rindx,int32(width))+1;
		ypos=mod(rindx,width)+1;
		A(xpos,ypos,color)=bitset(A(xpos,ypos,color),nbit,bit);
% 		if ri==width+1
% 			return;
% 		end
	end
end	