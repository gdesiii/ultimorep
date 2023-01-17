function [peaks_activations, time_activations] = detect_activation(data,time,multiplier)

%trovo le attivazioni per ogni caso per ogni soggetto

[num_casi, num_soggetti]= size (data);

%prealloco cell array 8x6, ogni colonna contiene i valori associati al
%primo e al secondo muscolo di ogni soggetto
peaks_activations = cell (num_casi, 2*num_soggetti);
time_activations= cell (num_casi, 2*num_soggetti);


for index_soggetto = 1: num_soggetti
for index_caso = 1: num_casi
    
    %Individuazione della soglia 
    
    muscles=cell2mat (data (index_caso, index_soggetto) );
    
    thr1=mean(muscles(:,1))+std(muscles(:,1))*multiplier;
    thr2=mean(muscles(:,2))+std(muscles(:,2))*multiplier;
    
    [peaks_m1,time_m1]=findpeaks( muscles(:,1),cell2mat (time(index_caso, index_soggetto)),'MinPeakDistance',5,'MinPeakHeight',thr1);
    [peaks_m2,time_m2]=findpeaks( muscles(:,1),cell2mat (time(index_caso, index_soggetto)),'MinPeakDistance',5,'MinPeakHeight',thr2);
    
    
    peaks_activations{index_caso, index_soggetto + index_soggetto -1}= peaks_m1;
    peaks_activations{index_caso, index_soggetto + index_soggetto}= peaks_m2;
    
    time_activations{index_caso, index_soggetto + index_soggetto -1}= time_m1;
    time_activations{index_caso, index_soggetto + index_soggetto}= time_m2;

end
end




end

