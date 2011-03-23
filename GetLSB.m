function A=GetLSB(M)
% A=GetLSB(M)
% Для матрици M размером m x n aункция возвращает  матрицу A такого же
% размера, заполненную младшими битами соответствующих чисет из М

A=bitget(M,1);