function [train_error, test_error,weights]= error_cal(train_set,train_label,test_set,test_label,lambda)
   
    weights=zeros(size(train_set,2),length(lambda));
    train_error=zeros(1,length(lambda));
    test_error=zeros(1,length(lambda));
    for i=1:size(lambda,2)    
        weights(:,i) = mylinridgereg(train_set, train_label, lambda(i));
        %{
        %  func_x_train = mylinridgeregeval(train_set,weights(:,i));  
        %  cost_train= cost_func(train_set,weights(:,i),train_label,lambda(i)); 
        %   disp(cost_train);
        %   if(i==1)
        %       opt_index=1;
        %       opt_cost_train=cost_train;
        %   end  
        %   if(opt_cost_train >= cost_train)
        %       opt_cost_train=cost_train;
        %       opt_index=i;     
        %   end  
        %}
        if(size(train_set,1) ~=0)
        func_x_train = mylinridgeregeval(train_set,weights(:,i));
        train_error(1,i)= meansquarederr(func_x_train, train_label);
        else
            train_error(1,i)=0;
        end
        if(size(test_set,1) ~=0)
        func_x_test = mylinridgeregeval(test_set,weights(:,i));
        test_error(1,i) = meansquarederr(func_x_test, test_label);  
        else
            test_error(1,i)=0;
        end
    end

end