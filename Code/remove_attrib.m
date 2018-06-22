%%%%%%%%%%% remove least significant attributes and error cal %%%%%%

lambda_choose= randi(length(lambda));
weights_choose=zeros(size(weights,1),0);
weights_choose(:,1)= abs(weights(:,lambda_choose));
for i = 1 : size(weights,1)
    weights_choose(i,2) = i ;
end
sort_weight= sortrows(weights_choose,1);
new_data= zeros(size(x,1),size(x,2)-3);
count=0;
for i=1:size(x,2)
    if (i ~= sort_weight(1,2) && i ~= sort_weight(2,2) && i ~= sort_weight(3,2))
        count=count+1;
        new_data(:,count)=x(:,i);
    else
        continue;
    end
end

[train_set_new,train_label_new,test_set_new,test_label_new]=fraction_norm(new_data,y,frac);
[train_error_new, test_error_new,weights_new]= error_cal(train_set_new,train_label_new,test_set_new,test_label_new,lambda);
