%%%%%%%%%%%%%% read file and normalise %%%
file_name='I:\IIT_ropar\ML\l2\linregdata.txt';

read1=readtable(file_name,'Delimiter',',','ReadVariableNames',false);

[x,y]=read_format(read1);

%%%%%%%%%%%%%% partition data %%%%%%%%%%%%%
frac=0.3;
[train_set,train_label,test_set,test_label]=fraction_norm(x,y,frac);


% %%%%%%%%%%%%% error calculation %%%%%%%%%%%
% lambda=[0 0.1 0.001 0.00001 0.0000001 0.000000001];
% lambda=[0 0.1 1 2 5 10 20]; 
% lambda=[0.001 0.01 0.1 0.5 1 5 100 500 1000];%%%% as we increase lambda weights tend to zero
% lambda=[0.1 0.3 0.5 0.7 0.9 1.1 1.3];
lambda=[0.001 0.1 1 2 5 10 20];

[train_error, test_error,weights]= error_cal(train_set,train_label,test_set,test_label,lambda);


%%%%%%%%%%% remove least significant attributes and error cal %%%%%%
%{
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

%}

%%%%100 iterations --- error_lambda %%%%%%

