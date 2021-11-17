clear all
noisyECG1 = load('100m.mat');
noisyECG=noisyECG1.val;
%noisyECG = S.noisyECG_withTrend;
plot(noisyECG)
xlabel('milliseconds')
ylabel('millivolts')

% Remove trend from data
detrendedECG = detrend(noisyECG,0);
% Visualize results
clf
plot(noisyECG,'Color',[109 185 226]/255,'DisplayName','Input data')
hold on
plot(detrendedECG,'Color',[0 114 189]/255,'LineWidth',1.5,...
    'DisplayName','Detrended data')
plot(noisyECG-detrendedECG,'Color',[217 83 25]/255,'LineWidth',1,...
    'DisplayName','Trend')
hold off
legend
xlabel('milliseconds')
ylabel('millivolts')

% Find local maxima
ismax = islocalmax(detrendedECG,'MinProminence',0.9);
% Visualize results
clf
plot(detrendedECG,'Color',[109 185 226]/255,'DisplayName','Input data')
hold on
% Plot local maxima
plot(find(ismax),detrendedECG(ismax),'^','Color',[217 83 25]/255,...
    'MarkerFaceColor',[217 83 25]/255,'DisplayName','Local maxima')
title(['Number of extrema: ' num2str(nnz(ismax))])
hold off
legend
xlabel('milliseconds')
ylabel('millivolts')

%Calculate the Heart Rate
maxIndices = find(ismax);
msPerBeat = mean(diff(maxIndices));
heartRate = 60*(1000/msPerBeat)