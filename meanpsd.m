function meanpsd (data, overlap, window, nfft, fs)
[num_caso, num_sogg] = size(data);

figure
for index_s = 1:num_sogg 
    
      
    %prealloco due matrici dove inserire i psd rispettivi al muscolo
    psd_m1 = zeros(floor(nfft/2)+1,num_caso);
    psd_m2 = zeros(floor(nfft/2)+1,num_caso);
    
    for index_caso = 1: num_caso
        
        signal = cell2mat(data(index_caso, index_s));

        %considero il primo muscolo
        [psd_m1(:,index_caso), f] = pwelch(signal(:,2),window,overlap,nfft,fs);
        %considero il secondo
        [psd_m2(:,index_caso), ~] = pwelch(signal(:,3),window,overlap,nfft,fs);
        
    end
    
    %plot media per ogni muscolo
    subplot(1,num_sogg, index_s)
    
    sgtitle('Spettro di potenza medio')
    semilogy(f, mean(psd_m1,2), 'color', 'r')
    hold on
    semilogy(f, mean(psd_m2,2), 'color', 'b')
    
    xlabel('Freq. [Hz]')
    ylabel('Power [dB]')

end

end