function p_value = my_permutation_test(a, b, N, title)
%considero solo le righe
[row, ~]=size(a);

figure
title(title)
for index_r = 1:row
    %Creazione della variabile osservata
    Tobs = abs(mean(a(index_r,:)) - mean(b(index_r,:)));
   
    pool=[a(index_r,:),b(index_r,:)];
    
    %preallocazione
    Trand=zeros(1,N);
    
    %creazione della variabile randomica Trand
    for index = 1 : N
        pool=pool(randperm(length(pool)));
        a1=pool(1:length(a));
        b1=pool(end-length(b): end);
        Trand(index) = abs(mean(a1) - mean(b1));
    end

    %calcolo valore p_value
    p_value = mean(Trand > Tobs);
    
    subplot(1,2, index_r)
    histogram(Trand,100)
    
    sgtitle(title)
%     title(strcat('muscolo ', num2str(index_r)))
    xlabel('Normalized muscle amplitude [a.u]')
    ylabel('Count')
end     
end
