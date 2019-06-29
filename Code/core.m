%Project4_可行解计算
node_num = 0;
all_num = K(1)*K(2);
x = 30; %可调节
y = order2(x,now_order(x)+1);
flag = 0;
while (node_num ~= all_num)
    if flag == 0    
        if now_order(x) ~= K(2)
             if now_order(x) == 0
                 next_position = order2(x,now_order(x) +2); 
                 y = now_order(x)+1;
             else
                 next_position = order2(x,now_order(x) +1);
             end
            result(x,next_position) = result(x,y) + steptimeow(x,y); 
             node_num = node_num+1;
            now_order(x) = now_order(x)+1;
            y = next_position;
            flag = 1;
        else
            for  k=(1:K(1))
                if now_order(k) ~= K(2)
                    x = k;
                    break
                end
            end
             y = now_order(x);
             flag == 0 ;
        end
    else
        for k=(1:K(1))
            if k ~= x                 
                if  (result(k,y)==0) && (order(k,y) == (now_order(k)+1))
                     result(k,y) = result(x,y) + steptimeow(x,y); 
                     x = k;
                     now_order(x) = now_order(x)+1;
                     node_num = node_num+1;
                     break
                else
                    if k == K(1)%如果找完了全部的行，仍然没有答案
                        flag = 0;
                        break
                    end
                end
            end
        end
        flag = 0;
    end     
end
