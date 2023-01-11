function output = data_normalization(data)

[num_casi, num_soggetti]= size (data);
%prealloco matrice 3D


for index_soggetti=1:num_soggetti

    %vettore che contiene le dimensioni di ogni caso di ogni paziente
    for index_casi=1:num_casi
        dim(index_casi)= length (cell2mat(data (index_casi,index_soggetti)));
    end
    
    %vettore che contiene concatenati tutti i valori dei muscoli
    muscles= cell2mat(data(:,index_soggetti));
    max_values = max (muscles);
    %normalizzo
    norm = muscles ./ max_values;
    %creo cell array con le separando i casi grazie al vettore dim
    %contenente le dimensioni di ognuno
    cell{index_soggetti}=mat2cell(norm, dim);
end


%QUESTO BRUTTO DA VEDERE QUINDI DA CAMBIARE MA NON AVEVO PIU' VOGLIA
for index_soggetti=1:num_soggetti
for index_casi=1:num_casi
    output{index_casi,index_soggetti}=cell{index_soggetti}(index_casi);
end
end

end

