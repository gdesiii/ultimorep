function  meanpsd (data, overlap, window, nfft, fs)
   [num_casi, num_soggetti] = size(data);
   
   
   
   for index_soggetto = 1: num_soggetti
      
       psd_m1 = zeros(floor((nfft/2)+1), num_soggetti);
       psd_m2 = zeros(floor((nfft/2)+1), num_soggetti);
       
      for index_caso = 1 : num_casi 
          
       muscles = cell2mat(data(index_caso,index_soggetto));
       
       [psd_m1(:,index_caso),f1] = pwelch(muscles(:,1),window,overlap,nfft,fs);
       [psd_m2(:, index_caso),f2] = pwelch(muscles(:,2),window,overlap,nfft,fs);
      
      end
      
      psd_N=psd_m1/trapz(psd_m1)
      
      
      mean_psd_m1= mean(psd_N,2)
      mean_psd_m2= mean(psd_m2,1);
       
       
       figure
       semilogy(f1, mean_psd_m1)
       hold on
       semilogy(f2,mean_psd_m2)
%        
   end

% [num_casi, num_soggetti]= size(data);
% 
% % mpsd = cell(num_casi, num_soggetti);
% 
% %vettore frequenza necessario per il plot dello spettro medio
% f=linspace(0, fs/2, floor(nfft/2)+1);
% 
% %creo un cell array in cui metterò per ogni soggetto la media
% mean_psd = cell (num_soggetti,2);
% 
% for index_soggetto = 1 : num_soggetti
% 
%     %creo due matrici per ogni soggetto per poter inserire al loro interno
%     %gli spettri di densità di potenza  
% 
%     psd_matrix_m1 = zeros(floor((nfft/2)+1), num_casi);
%     psd_matrix_m2 = zeros(floor((nfft/2)+1), num_casi);
% 
% for index_caso = 1 : num_casi
% 
%     signal = cell2mat(data(index_caso, index_soggetto));
% 
%     muscles = [signal(:,1), signal(:,2)];
% 
%    %calcolo spettro medio per ogni muscolo 
%    [psd_m1, ~]=pwelch(muscles(:,1), window, overlap, nfft, fs);
%    [psd_m2, ~]=pwelch(muscles(:,2), window, overlap, nfft, fs);
% 
%    %e inserisco nelle rispettive matrici
%    psd_matrix_m1(:, index_caso) = psd_m1;
%    psd_matrix_m2(:, index_caso) = psd_m2;
% 
% end
%     %calcolo la media per ogni muscolo
%     mean_psd {index_soggetto, 1} = mean(psd_matrix_m1,2);
%     mean_psd {index_soggetto, 2} = mean(psd_matrix_m2,2);
% 
% end
%     mpsd = mean_psd;
% 
%     %plot
% 
%     for index = 1 : num_soggetti
%     subplot(1,3,index)
%     sgtitle("Spettro di potenza medio")
%     semilogy(f,cell2mat(mpsd(index,1)))
%     hold on
%     semilogy(f,cell2mat(mpsd(index,2)))
%     end
end