function [output1,output2] = data_normalization(data)
%DATA_NORMALIZATION Summary of this function goes here
%   Detailed explanation goes here
for index=1 : 1 : 8
    data_matrix=cell2mat(data(index,1));
    if index==1
        vector_muscle1=[data_matrix(:,2)];
        vector_muscle2=[data_matrix(:,3)];
       
    end
    if index>1
        vector_muscle1=[vector_muscle1;data_matrix(:,2)];
        vector_muscle2=[vector_muscle2;data_matrix(:,3)];
       
    end
end 
max_value1=max(vector_muscle1);
max_value2=max(vector_muscle2);
norm_muscle1=vector_muscle1/max_value1;
norm_muscle2=vector_muscle2/max_value2;

cell_norm_muscle1=mat2cell(norm_muscle1, [length(cell2mat(data(1,1))) length(cell2mat(data(2,1))) length(cell2mat(data(3,1))) length(cell2mat(data(4,1))) length(cell2mat(data(5,1))) length(cell2mat(data(6,1))) length(cell2mat(data(7,1))) length(cell2mat(data(8,1)))] ,[1] );
cell_norm_muscle2=mat2cell(norm_muscle2, [length(cell2mat(data(1,1))) length(cell2mat(data(2,1))) length(cell2mat(data(3,1))) length(cell2mat(data(4,1))) length(cell2mat(data(5,1))) length(cell2mat(data(6,1))) length(cell2mat(data(7,1))) length(cell2mat(data(8,1)))] ,[1] );

output1=cell_norm_muscle1;
output2=cell_norm_muscle2;

end

