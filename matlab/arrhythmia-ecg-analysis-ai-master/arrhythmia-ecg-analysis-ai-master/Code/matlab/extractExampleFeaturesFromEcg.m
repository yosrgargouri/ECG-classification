function features = extractExampleFeaturesFromEcg(filename, filepath, type, exportFilename)

% USAGE: features = extractExampleFeaturesFromEcg('200m', '../data/200m', 'VT', '../data/exported/vt-200m')
% This function shows step by step to extract features from a ECG file.

% Last version
% extractEcgFeatures.m           D. Kawasaki			17 June 2017
% 		      Davi Kawasaki	       14 October 2017 version 2.0

% First load the ECG signal from a file
[tmSeg,ecgsig,Fs,sizeEcgSig,timeEcgSig] = loadEcgSignal(filepath);

%annotationsEcg = readAnnotations(filename);

% Then read the arrhythmia periods from the respective type
arrhythmiaPeriods = readArrythmiaPeriods(type, filepath);

% Extract multiple QRS periods from the respective arrhythmia type
arrhythmiaMultipleQRS = extractMultipleQRS(arrhythmiaPeriods, sizeEcgSig, timeEcgSig, ecgsig, tmSeg, filename, type);

% Then extract the signal peaks with DWT
DWTsignalPeaks = extractDWTsignalPeaks(arrhythmiaMultipleQRS, 0.5, 0.150, filename, type);

% Get age, sex and medicine characteristics
[age, sex, medicine] = readPatientInfo(filepath);

% Lastly, extract the ECG features to a CSV or to another variable
features = extractEcgFeatures(DWTsignalPeaks, exportFilename, age, sex, medicine);
    
end