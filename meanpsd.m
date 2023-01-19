function meanpsd (data, overlap, window, nfft, fs)
[~, num_sogg] = size(data);
% f = linspace(0, fs/2, floor(nfft/2)+1);
for index_s = 1:num_sogg  
    
    segnale = [cell2mat(data(1,index_s)); cell2mat(data(2,index_s)); cell2mat(data(3,index_s)); cell2mat(data(4,index_s));cell2mat(data(5,index_s));cell2mat(data(6,index_s));cell2mat(data(7,index_s));cell2mat(data(8,index_s))];
    
    [psd, f] = pwelch(segnale,500,250,1024,fs);
    
    figure
    plot (f, 20*log10(psd(:,1)))
    hold on
    plot (f, 20*log10(psd(:,2)))
    hold off
end
end