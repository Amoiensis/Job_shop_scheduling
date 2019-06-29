%Project4_成本计算
summation = result+steptimeow;
cost = max(summation')';
for i=(1:K(2))%列
    cost(i,2) = 0;  %第二列赋值为0
end

Total_costsum = sum(totalcost)%总成本

Orign_accmulate = sum(sum (steptimeow)) %原始数据的累计用时

Latest_Time = max(max(result))  %结果中最大的用时
