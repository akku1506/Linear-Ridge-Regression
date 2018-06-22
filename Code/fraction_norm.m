function [train_set,train_label,test_set,test_label]=fraction_norm(x,y,frac)

    train_size=ceil(frac*size(x,1));
    train_dummy=x(1:train_size,:);
    train_label=y(1:train_size,:);
    
    m_train=mean(train_dummy);
    s_train=std(train_dummy);
    %high_train=max(train_set);
    %low_train=min(train_set);

    train_set=zeros(size(train_dummy,1),size(train_dummy,2));

    for i=1:size(train_dummy,2)
        if(i==1)%((high_train(i)-low_train(i))==0))% || (high_train(i)== 1 && low_train(i)==0))
            train_set(:,i)=train_dummy(:,i);
        else
            train_set(:,i)=(train_dummy(:,i)-m_train(i))/s_train(i);%(high_train(i)-low_train(i)); 
        end
    end

    if(frac ~=1)
        test_dummy=x(train_size+1:end,:);
        test_label=y(train_size+1:end,:);

%{
        m_test=mean(test_dummy);
        s_test=std(test_dummy);
        high_test=max(test_dummy);
        low_test=min(test_dummy);
%}
        test_set=zeros(size(test_dummy,1),size(test_dummy,2));

        for i=1:size(test_dummy,2)
            if (i==1) %(((high_train(i)-low_train(i))==0))% || (high_test(i)== 1 && low_test(i)==0))
                test_set(:,i)=test_dummy(:,i);
            else
                test_set(:,i)=(test_dummy(:,i)-m_train(i))/s_train(i);%(high_test(i)-low_test(i)); 
            end
        end
    else
        test_set=zeros(0,0);
        test_label=zeros(0,0);
    end
end