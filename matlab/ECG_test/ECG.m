load(fullfile(tempdir,'ECGData','ECGData.mat'))


percent_train = 70;
[trainData,testData,trainLabels,testLabels] = helperRandomSplit(percent_train,ECGData);

Ctrain = countcats(categorical(trainLabels))./numel(trainLabels).*100;
Ctest = countcats(categorical(testLabels))./numel(testLabels).*100;

helperPlotRandomRecords(ECGData,14)

N = size(ECGData.Data,2);
sn = waveletScattering('SignalLength',N, 'InvarianceScale',150,'SamplingFrequency',128);

[fb,f,filterparams] = filterbank(sn);
subplot(211)
plot(f,fb{2}.psift)
xlim([0 128])
grid on
title('1st Filter Bank Wavelet Filters');
subplot(212)
plot(f,fb{3}.psift)
xlim([0 128])
grid on
title('2nd Filter Bank Wavelet Filters');
xlabel('Hz');


figure;
phi = ifftshift(ifft(fb{1}.phift));
psiL1 = ifftshift(ifft(fb{2}.psift(:,end)));
t = (-2^15:2^15-1).*1/128;
scalplt = plot(t,phi);
hold on
grid on
ylim([-1.5e-4 1.6e-4]);
plot([-75 -75],[-1.5e-4 1.6e-4],'k--');
plot([75 75],[-1.5e-4 1.6e-4],'k--');
xlabel('Seconds'); ylabel('Amplitude');
wavplt = plot(t,[real(psiL1) imag(psiL1)]);
legend([scalplt wavplt(1) wavplt(2)],{'Scaling Function','Wavelet-Real Part','Wavelet-Imaginary Part'});
title({'Scaling Function';'Coarsest-Scale Wavelet First Filter Bank'})
hold off