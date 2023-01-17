function meanpsd (data, overlap, window, nfft, fs)

[num_casi, num_soggetti]= size(data);

%vettore frequenza necessario per il plot dello spettro medio
f=linspace(0, fs/2, floor(nfft/2)+1);

%creo un cell array in cui metterò per ogni soggetto la media
mean_psd = cell (num_soggetti,2);

for index_soggetto = 1 : num_soggetti
    
    %creo due matrici per ogni soggetto per poter inserire al loro interno
    %gli spettri di densità di potenza  
    
    psd_matrix_m1 = zeros(floor((nfft/2)+1), num_casi);
    psd_matrix_m2 = zeros(floor((nfft/2)+1), num_casi);
    
for index_caso = 1 : num_casi
    
    signal = cell2mat(data(index_caso, index_soggetto));
    
    muscles = [signal(:,1), signal(:,2)];
    
   %calcolo spettro medio per ogni muscolo 
   [psd_m1, ~]=pwelch(muscles(:,1), window, overlap, nfft, fs);
   [psd_m2, ~]=pwelch(muscles(:,2), window, overlap, nfft, fs);
   
   %e inserisco nelle rispettive matrici
   psd_matrix_m1(:, index_caso) = psd_m1;
   psd_matrix_m2(:, index_caso) = psd_m2;
   
end
    %calcolo la media per ogni muscolo
    mean_psd {index_soggetto, 1} = mean(psd_matrix_m1,2);
    mean_psd {index_soggetto, 2} = mean(psd_matrix_m2,2);
    
    
    subplot(1,3,index_soggetto)
    plot(f,cell2mat(mean_psd(index_soggetto,:)))
    ylim  ([0 0.002])
    xlim ([0 200])
    
    
end
   
end