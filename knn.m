clc;clear
data = textread('flower.txt','%s');
[m,n] = size(data);
X = zeros(m,1);

% 把文本数据转化为矩阵
i = 1 ;
while i <m 
    X(i) = str2num(data{i});
    i = i+1 ;
    if mod(i,5) == 0
        i = i +1 ;
    end
end

% 把{setosa,versicolor,virginica}编码为{0,1,2}
train_X = zeros(m/5,4);
labels = zeros(m/5,1);
labels(50:98) = 1; 
labels(99:end) = 2; % 训练数据的标签值

% 把文本数据转化为矩阵
for i = 1:m/5
    train_X(i,:) = X(5*i-4:5*i-1); 
end

% 测试数据
test_X = [5.4,3.4,1.5,0.4
          6.1,2.9,4.7,1.4
          7.9,3.8,6.4,2];
      
% cell记录文本标签
cell{1} = 'setosa'
cell{2} = 'versicolor'
cell{3} = 'virginica'

[datarow , datacol] = size(train_X); 
 k = 7; % 邻居数
 
for i = 1:3  % 对每个测试数据进行分类
    diffMat = repmat(test_X(i,:),[datarow,1]) - train_X; % 计算欧式距离矩阵
    distanceMat = sqrt(sum(diffMat.^2,2));
    [B , IX] = sort(distanceMat,'ascend');  % 距离从小到排序
    len = min(k,length(B));   % 找出前k个出现类别标签最多的，作为分类结果
    result_label(i) = mode(labels(IX(1:len)))
   if result_label(i) == 0  % 将数值标签转换回文字标签
    finall_result{i} = cell{1}
   end
    
   if result_label(i) == 1
    finall_result{i} = cell{2}
   end
    
    if result_label(i) == 2
    finall_result{i} = cell{3} 
    end
    
end
   


    