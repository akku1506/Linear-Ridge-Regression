%%%%%%%%%%%%%% min error nd lambda %%%%%%%%%%%

train_mean=mean(big_mat_train,3);
test_mean=mean(big_mat_test,3);

min_val_lambda=zeros(1,size(test_mean,2));
min_error=zeros(1,size(test_mean,2));

for i=1:size(test_mean,2)
    min_error(i)=min(test_mean(:,i));
    for j=1:size(test_mean,1)
        if(test_mean(j,i)== min_error(i))
            break;
        end
    end
    min_val_lambda(i)=j;
end

corres_lambda=zeros(1,length(min_val_lambda));
for i=1:length(min_val_lambda);
    corres_lambda(i)=lambda(min_val_lambda(i));
end

%%% from the graphs we can see that the we are getting minimum avg test error at lambda=1 and fraction value 0.9
%%% so we gonna plot graphs ar these values...

frac_opt=0.9;
[train_set_opt,train_label_opt,test_set_opt,test_label_opt]=fraction_norm(x,y,frac_opt);
lambda_opt=1;
weights_opt = mylinridgereg(train_set_opt, train_label_opt, lambda_opt);
func_x_train_opt = mylinridgeregeval(train_set_opt,weights_opt);
func_x_test_opt = mylinridgeregeval(test_set_opt,weights_opt);

