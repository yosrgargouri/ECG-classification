clear all
%Load Data
ECGData=readtable('TEST3.txt');
ECGData.Etat=categorical(ECGData.Etat);

%Summary of Data
summary(ECGData)

%split data
% Cross varidation (train: 70%, test: 30%)
cv = cvpartition(size(ECGData,1),'HoldOut',0.3);
idx = cv.test;
% Separate to training and test data
dataTrain = ECGData(~idx,:);
dataTest  = ECGData(idx,:);

%Summary of  Train Data
summary(dataTrain)

%%Summary of  Test Data
summary(dataTest)

% %Create Model
% classificationLearner
% trainedModel = trainClassifier(dataTrain);
%  
% % %Visualize the Training Accuracy
% trainPred=trainedModel.predictFcn (dataTrain(:,1:7));
% 
% %Accuracy
% MLAccuracytrain = sum(trainPred == dataTrain.Etat)/numel(trainPred)*100
% 
% %confision matrix
% figure
% dummyEtat = dummyvar(dataTrain.Etat);
% tdummyEtat = transpose(dummyEtat); 
% dummytrainPred= dummyvar(trainPred);
% tdummytrainPred = transpose(dummytrainPred); 
% plotconfusion(tdummyEtat,tdummytrainPred,'Confusion Chart for ML')
% 
% %Viisulize the Testing Accuracy
% testPred=trainedModel.predictFcn (dataTest(:,1:7));
% 
% %Accuracy
% MLAccuracytest = sum(testPred == dataTest.Etat)/numel(testPred)*100
% 
% %confision matrix
% figure
% dummyTestData = dummyvar(dataTest.Etat);
% tdummyTestData = transpose(dummyTestData); 
% dummytestPred= dummyvar(testPred);
% tdummytestPred = transpose(dummytestPred); 
% plotconfusion(tdummyTestData,tdummytestPred ,'Confusion Chart for ML')