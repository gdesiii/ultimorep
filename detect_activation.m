function [peak_activations, time_activations] = detect_activation(data,time,multiplier)
%Individuazione della soglia 
thr=mean(data)+std(data)*multiplier;
[peak_activations,time_activations]=findpeaks(data,time,'MinPeakDistance',5,'MinPeakHeight',thr);
end

