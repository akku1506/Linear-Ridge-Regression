%%%%%%%%%%%%%% 100 iterations %%%%%%%%%%%
frac_array=[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
big_mat_train=zeros(length(lambda),length(frac_array),100);
big_mat_test=zeros(length(lambda),length(frac_array),100);

for loop=1:100
    for frac_ind=1:length(frac_array)
        [x1,y1]=read_format(read1);
        [train_set1,train_label1,test_set1,test_label1]=fraction_norm(x1,y1,frac_array(frac_ind));
        for lambda_ind=1:length(lambda)
            [train_error1, test_error1,weights1]= error_cal(train_set1,train_label1,test_set1,test_label1,lambda(lambda_ind));
            big_mat_train(lambda_ind,frac_ind,loop)=train_error1;
            big_mat_test(lambda_ind,frac_ind,loop)=test_error1;
        end
    end
end