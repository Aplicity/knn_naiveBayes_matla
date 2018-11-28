% 输出参数：min_d -- x1 与最近邻点点距离，
%         ind -- 最紧邻点点下标，当ind=2时，及x2为最紧邻点

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
