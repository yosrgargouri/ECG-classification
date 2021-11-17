clear all
load('ECGData.mat');
data = ECGData.Data;
labels=ECGData.Labels;

ARP=data(1:30,:);
CHF=data(97:126,:);
NSR=data(127:156,:);
signallength=500;

fb=cwtfilterbank('signallength',signallength,'Wavelet','amor','VoicePerOctave',12);

