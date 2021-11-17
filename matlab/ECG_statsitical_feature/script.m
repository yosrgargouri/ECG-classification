%ECG signal
clear all

%sample 2017
data2=load('S0014lrem.mat');
ECG_denosing = myMedfilt(data2.val,65) ;
%plot size 65
figure
fs=1000;
y=ECG_denosing/1000;
y=y';
plot(y(1:3*fs)); %plot first 10 second data
title('denoising ECG signal (R=65)');

% ECG_denosing1 = myMedfilt(data2.val,129) ;
% %plot size 129
% figure
% fs=1000;
% z=ECG_denosing1/1000;
% z=z';
% plot(z(1:9*fs)); %plot first 10 second data
% title('denoising ECG signal (R=129)');

%Statistical Features: Mean, Standard Deviation, Skewness, Variance
mean = mean(ECG_denosing)
Standard_Deviation = std(ECG_denosing)
Skewness = skewness(ECG_denosing)
Variance = var(ECG_denosing)

