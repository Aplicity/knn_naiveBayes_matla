clc;clear
x1 = [1 1 1 2 2 2 3 3 3 3]' ;
x2 = [0 1 1 0 0 1 2 1 2 1]' ; % ��{S,M,L} �����{0��1��2}
labels = [-1,-1,1,1,-1,-1,-1,1,1,-1]';

train_X = [x1,x2];
test_X = [2,0];
Nb=fitcnb(train_X,labels); % ������ѧϰ
y_nb=Nb.predict(test_X)    % ����Ԥ��
