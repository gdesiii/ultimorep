function [meanpsd_m11, meanpsd_m12] = psd ( data, overlap, window, nfft, fs)

% data=emg_data(:, 1);
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
[psd_m11, ~]=pwelch(vector_muscle1', window, overlap, nfft, fs);
[psd_m12, ~]=pwelch(vector_muscle2', window, overlap, nfft, fs);

meanpsd_m11=mean(psd_m11,2);
meanpsd_m12=mean(psd_m12,2);
end

