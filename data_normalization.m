function output = data_normalization(data)

[num_casi, num_soggetti]= size (data);

%prealloco cell array
output = cell (num_casi, num_soggetti);


for index_soggetti=1:num_soggetti

    %vettore che contiene le dimensioni di ogni caso di ogni paziente
    for index_casi=1:num_casi
        dim(index_casi)= length (cell2mat(data (index_casi,index_soggetti)));
    end
        
    %vettore che contiene concatenati tutti i valori dei muscoli
    muscles = cell2mat(data(:,index_soggetti));
    max_values = max (muscles);
    %normalizzo
    norm = muscles ./ max_values;
    
    index_m=cumsum([1 dim]);
    for index=1:8
        output {index, index_soggetti}=norm(index_m(index): index_m(index+1)-1, :);
    end
       
%      thr1=mean(norm(:,1))+std(muscles(:,1))*0.5
%     
%     figure
%     plot(time, norm(1:135187,1))
%     hold on
%     yline(thr1, 'linewidth',5)
%     ylim ([0 0.5])
%     xlim ([0 70])
end



end

