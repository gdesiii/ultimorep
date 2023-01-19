function p_value = my_permutation_test(a, b, N)
  
[row, ~]=size(a);
for index=1:row
Tobs = abs(mean(a(index,:)) - mean(b(index,:)));
    
%     nA = numel(a);
%     nB = numel(b);
%     lenght(nA+nB);
   
    pool=[a(index,:),b(index,:)];
    
    Trand=zeros(1,N);
    for index=1:N
        pool=pool(randperm(length(pool)));
        a1=pool(1:length(a));
        b1=pool(end-length(b): end);
        Trand(index) = abs(mean(a1) - mean(b1));
    end
    
    p_value = sum (gt (Trand,Tobs))/N;
    
    figure
    histogram(Trand)
    xline(Tobs)
end
     %pvalue = mean(Trand > Tobs)
end

