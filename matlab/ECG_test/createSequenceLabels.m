function [sequence_labels_train,sequence_labels_test] = createSequenceLabels(Nseq,trainLabels,testLabels)
% 



%%
%
% Nseq = 16;
idxARR = strcmpi(trainLabels,'ARR');
ARRtmp = repelem(trainLabels(idxARR),Nseq);
idxCHF = strcmpi(trainLabels,'CHF');
CHFtmp = repelem(trainLabels(idxCHF),Nseq);
idxNSR = strcmpi(trainLabels,'NSR');
NseqRtmp = repelem(trainLabels(idxNSR),Nseq);
sequence_labels_train = [ARRtmp; CHFtmp; NseqRtmp];
%%

idxARR = strcmpi(testLabels,'ARR');
ARRtmp = repelem(testLabels(idxARR),Nseq);
idxCHF = strcmpi(testLabels,'CHF');
CHFtmp = repelem(testLabels(idxCHF),Nseq);
idxNSR = strcmpi(testLabels,'NSR');
NseqRtmp = repelem(testLabels(idxNSR),Nseq);
sequence_labels_test = [ARRtmp; CHFtmp; NseqRtmp];