% ���������min_d -- x1 ������ڵ����룬
%         ind -- ����ڵ���±꣬��ind=2ʱ����x2Ϊ����ڵ�

function [min_d,ind]= my_diff(p)

x1 = [1;1;2];
x2 = [5;2;4];
x3 = [8;1;8];
x4 = [4;3;7];
X=[x2,x3,x4];


for i = 1:3
    if p == 1
        error(:,i) =abs( x1 - X(:,i));
        d(i) = sum(error(:,i));
    end
    
    if p > 1
        error(:,i) =abs( x1 - X(:,i));
        d(i) = (sum(error(:,i).^2))^(1/p);
    end
end


[min_d,a] = min(d);
ind = a + 1
