%ECG signal
fs=1000;
x=load('s0306lrem.mat');
y=x.val/2000;
y=y';


plot(y(1:10*fs)); %plot first 10 second data
title('original ECG signal (normal)');

