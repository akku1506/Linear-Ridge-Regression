function [x,y]= read_format(read1)

%%%%%%%permute dataset%%%%%%%%%%%%%%%
read=read1(randperm(height(read1)),:);

y=table2array(read(:,width(read)));
T = array2table(zeros(height(read),3),'VariableNames',{'a','b','c'});
p=horzcat(read(:,1:width(read)-1),T);

new_cell=table2cell(p);

[r1,c1]=find(strcmp(new_cell(:,1),'M'));
new_cell(r1,width(p))={1};

[r2,c2]=find(strcmp(new_cell(:,1),'F'));
new_cell(r2,width(p)-1)={1};

[r3,c3]=find(strcmp(new_cell(:,1),'I'));
new_cell(r3,width(p)-2)={1};

%{
for i=1:height(p)   
   if(a{i}== 'M')
       p{i,'c'}=1;
   end   
   if(a{i}== 'F')
       p{i,'b'}=1;
   end
   if(a{i}== 'I')
       p{i,'a'}=1;
   end
end
%}
new_cell(:,1)={1};

x= cell2mat(new_cell(:,1:size(new_cell,2)));

end