function Message=genRndMessage(len)
%function Message=genRndMessage(len)
%функция генерирует случайное сообщение размером len байт

Message = uint8(zeros(1,len));
for i=1:len
	for j=1:8
		bit = randi([0 1]);
		Message(i)=bitset(Message(i),j,bit);
	end
end
