function [envelops, time]= get_envelope(data, fs)

%filtro passa banda
%rettifico
%filtro passa basso

%ho 3 soggetti
%ogni soggetto ha 8 casi
%ogni caso ha 2 muscoli

% data è il cell array

[num_casi, num_soggetti]= size (data);

%prealloco la matrice che conterrà i vettori temporali
time = cell(num_casi, num_soggetti);

% prealloco il cell arrray envelops che conterrà per ogni soggetto
% l'inviluppo di ogni segnale
envelops = cell (num_casi, num_soggetti);

for index_soggetto = 1: num_soggetti
for index_caso = 1: num_casi
    
    signal = cell2mat(data(index_caso, index_soggetto));
    
    %signal(:,1) = asse tempo
    %signal(:,2) = muscolo 1 
    %signal(:,3) = muscolo 2
    
    %separo l'asse temporale dai dati dei due muscoli
    time{index_caso, index_soggetto}= signal(:,1);
    muscles = [signal(:,2) , signal(:,3)];
    
 %filtro passa banda
    wn= [20 , 500];
    %mi servono le frequenze normalizzate
    wn = wn / (fs/2);
    
    %mi aspetto solo coeff. b
    order=4;
    [b,a] = butter(order,wn,"bandpass");

    sig_filtered_m1 = filter(b, a, muscles(:,1));
    sig_filtered_m2 = filter(b, a, muscles(:,2));
    
 %rettifica
    sig_rec_m1= abs (sig_filtered_m1);
    sig_rec_m2= abs (sig_filtered_m2);
    
 %filtro passa basso
    %frequenza limite normalizzata
    wn = 4 / fs/2;

    %mi aspetto solo coeff. b
    order=3000;
    [b,a] = fir1(order,wn,'low');

    sig_low_m1 = filter(b, a, sig_rec_m1);
    sig_low_m2 = filter(b, a, sig_rec_m2);
    
    %inviluppo come valore assoluto del segnale filtrato
    single_envelope_m1 = abs (sig_low_m1);
    single_envelope_m2 = abs (sig_low_m2);
    
    single_envelope = [single_envelope_m1, single_envelope_m2];
    %PLOT confronto tra segnale originale e segnale filtrato
    
%     subplot (2,1,1)
%     sgtitle(strcat ('plot inviluppo soggetto ', num2str(index_soggetto), ' caso ', num2str(index_caso) ) );
%     plot(cell2mat (time (index_caso, index_soggetto)), muscles(:,1),"Color","k")
%     hold on
%     plot( cell2mat(time (index_caso, index_soggetto)), single_envelop(:,1),"Color", "r")
%     
%     subplot (2,1,2)
%     plot(cell2mat(time (index_caso, index_soggetto)), muscles(:,2),"Color","k")
%     hold on
%     plot(cell2mat(time(index_caso, index_soggetto)), single_envelop(:,2),"Color", "r")
%     
    %riempio il cell array
    envelops {index_caso,index_soggetto} = single_envelope;
end
end


end

