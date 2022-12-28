function [output] = data_normalization(data)
%DATA_NORMALIZATION Summary of this function goes here
%   Detailed explanation goes here
index=1;
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
vector_tot=[vector_muscle1;vector_muscle2];
max_value_tot=max(vector_tot);
   
for index=1 : 1 : 8
    data_matrix=cell2mat(data(index,1));
    data_matrix_m1=data_matrix(:,2)/max_value_tot;
    data_matrix_m2=data_matrix(:,3)/max_value_tot;
    %matrice con tempo + dati normalizzati
    matrix=[data_matrix(:,1);data_matrix_m1;data_matrix_m2];
  %completare il passaggio in out
    if index==1
        %cell=mat2cell(matrix);
    end
    if index>1
        %cell=[mat2cell(,);
    end
end
output=cell;
end

