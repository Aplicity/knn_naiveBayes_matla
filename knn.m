clc;clear
data = textread('flower.txt','%s');
[m,n] = size(data);
X = zeros(m,1);

% ���ı�����ת��Ϊ����
i = 1 ;
while i <m 
    X(i) = str2num(data{i});
    i = i+1 ;
    if mod(i,5) == 0
        i = i +1 ;
    end
end

% ��{setosa,versicolor,virginica}����Ϊ{0,1,2}
train_X = zeros(m/5,4);
labels = zeros(m/5,1);
labels(50:98) = 1; 
labels(99:end) = 2; % ѵ�����ݵı�ǩֵ

% ���ı�����ת��Ϊ����
for i = 1:m/5
    train_X(i,:) = X(5*i-4:5*i-1); 
end

% ��������
test_X = [5.4,3.4,1.5,0.4
          6.1,2.9,4.7,1.4
          7.9,3.8,6.4,2];
      
% cell��¼�ı���ǩ
cell{1} = 'setosa'
cell{2} = 'versicolor'
cell{3} = 'virginica'

[datarow , datacol] = size(train_X); 
 k = 7; % �ھ���
 
for i = 1:3  % ��ÿ���������ݽ��з���
    diffMat = repmat(test_X(i,:),[datarow,1]) - train_X; % ����ŷʽ�������
    distanceMat = sqrt(sum(diffMat.^2,2));
    [B , IX] = sort(distanceMat,'ascend');  % �����С������
    len = min(k,length(B));   % �ҳ�ǰk����������ǩ���ģ���Ϊ������
    result_label(i) = mode(labels(IX(1:len)))
   if result_label(i) == 0  % ����ֵ��ǩת�������ֱ�ǩ
    finall_result{i} = cell{1}
   end
    
   if result_label(i) == 1
    finall_result{i} = cell{2}
   end
    
    if result_label(i) == 2
    finall_result{i} = cell{3} 
    end
    
end
   


    