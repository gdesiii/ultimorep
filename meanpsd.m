function meanpsd (data, overlap, window, nfft, fs)
[~, num_sogg] = size(data);
% f = linspace(0, fs/2, floor(nfft/2)+1);
for index_s = 1:num_sogg  
    
    segnale = [cell2mat(data(1,index_s))];
    
    [psd, f] = pwelch(segnale,10000,500,1024,fs);
    
    figure
    plot (f, 20*log10(psd(:,1)))
    hold on
    plot (f, 20*log10(psd(:,2)))
    hold off
end
end