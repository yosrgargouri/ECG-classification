clear all 
%ECG=load('103m.mat');
%ECG=load('101m.mat');
%ECG=load('S0017lrem.mat');
ECG=load('S0436_rem.mat');
%ECG=load('S0474_rem.mat');
%ECG=load('S0543_rem.mat');
%figure
%plot(ECG.val)
ECG_denosing = myMedfilt(ECG.val,65) ;
%plot size 65
fs=1000;
y=ECG_denosing/1000;
y=y';
figure
plot(y(1*fs:6*fs)); %plot first 10 second data
figure
plot(y(1:10*fs)); %plot first 10 second data
title('denoising ECG signal (R=65)');
beat_count =0 ;
kmax =0 ;
for k = 2 : length(ECG.val) -1 
    if ( ECG.val(k) >= ECG.val(k-1) & ECG.val(k)>= ECG.val(k+1) & ECG.val(k) >1500 & k > kmax+50 )
        kmax = k
        beat_count = beat_count +1 ;
    end
end



% fs=360;
% N=length(ECG.val);
% duration_in_sec=N/fs;
% duration_in_min=duration_in_sec/60;
% BPM_ecg=beat_count/duration_in_min

