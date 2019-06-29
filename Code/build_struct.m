%用于解决Job shop scheduling问题
%运用方法：启发式策略、近邻

order = orign(:,4:2:end)+1;   %加工顺序更改为 从1开始
K =size(order);%矩阵的大小
steptime = orign(:,5:2:end);    %加工每一步的用时
weight = orign(:,1);%权重


for i=(1:K(1))%行
    for j=(1:K(2))%列
        order2(i,order(i,j)) = j;   %order按照工序排列用时
    end
end

for i=(1:K(1))%列
        now_order(i) = 0; 
end

for i=(1:K(1))%行
    for j=(1:K(2))%列
        steptime2(i,order(i,j)) = steptime(i,j);    %steptime2按照工序排列用时
    end
end

for i=(1:K(1))%行
    for j=(1:K(2))%列
        steptimeow(i,order(i,j)) = steptime2(i,order(i,j))/weight(i);   %平权后用时
    end
end

result (K(1),K(2)) = 0;
for i=(1:K(1))%行
    for j=(1:K(2))%列
        result(i,j) = 0;%inf;  %生成安排的结果矩阵
    end
end


summation = result+steptimeow;
cost = max(summation')';
for i=(1:K(2))%列
    cost(i,2) = 0;  
end

totalcost = max(cost')';%实现max{0，Ci-di}

Csum = sum(totalcost);%总成本
