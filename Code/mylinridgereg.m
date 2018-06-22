function w= mylinridgereg(x, y, lambda)

% temp1=x'*x;
% temp2=lambda*eye(size(x,2));
% temp_3= temp1+temp2;
% temp_4= temp_3\x'; %  inv(temp_3)*x'
% w=temp_4*y ;

w=(x'*x + lambda*eye(size(x,2)))\x'*y;

end