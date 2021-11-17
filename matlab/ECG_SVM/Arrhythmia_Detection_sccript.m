
%Load Data
TrainData=readtable('samples-training.xlsx');
TestData=readtable('samples-testing.xlsx');
TrainData.Gender=categorical(TrainData.Gender);
TrainData.Arrhythmia=categorical(TrainData.Arrhythmia);
TestData.Gender=categorical(TestData.Gender);
TestData.Arrhythmia=categorical(TestData.Arrhythmia);

%Summary of Data
summary(TrainData)
summary(TestData)

%Histogram of Age, Gender and Types of  Arrhythmias of Training Data
%Histogram of age
figure 
histogram(TrainData.Age) 
age=TrainData.Age;
axis tight 
xlabel('Age')
ylabel('count')

%Histogram of M/F
figure
histogram(TrainData.Gender) 
gender = TrainData.Gender;
axis tight 
xlabel('Gender')
ylabel('count')

%Histogram of Arrhythmias
figure 
histogram(TrainData.Arrhythmia) 
axis tight 
xlabel('Gender')
ylabel('count')

%Create Model
%classificationLearner
 trainedModel = trainClassifier(TrainData);
 
% %Visualize the Training Accuracy
 trainPred=trainedModel.predictFcn (TrainData(:,1:5));
% 
% %Accuracy
 MLAccuracytrain = sum(trainPred == TrainData.Arrhythmia)/numel(trainPred)*100
 Arrhythmia=TrainData.Arrhythmia;
% 
%confision matrix
figure
dummyArrhythmia = dummyvar(Arrhythmia);
tdummyArrhythmia = transpose(dummyArrhythmia); 
dummytrainPred= dummyvar(trainPred);
tdummytrainPred = transpose(dummytrainPred); 
t1=tdummyArrhythmia==tdummytrainPred;
plotconfusion(tdummyArrhythmia,tdummytrainPred,'Confusion Chart for ML')

%Viisulize the Testing Accuracy
testPred=trainedModel.predictFcn (TestData(:,1:5));

%Accuracy
MLAccuracytest = sum(testPred == TestData.Arrhythmia)/numel(testPred)*100

%confision matrix
figure
dummyTestData = dummyvar(TestData.Arrhythmia);
tdummyTestData = transpose(dummyTestData); 
dummytestPred= dummyvar(testPred);
tdummytestPred = transpose(dummytestPred); 
plotconfusion(tdummyTestData,tdummytestPred ,'Confusion Chart for ML')
