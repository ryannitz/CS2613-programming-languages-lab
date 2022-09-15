%% Step 5
clear; clc;
addpath('Lib\');


%Check if file exists instead of catching the load fail 
try
    dataPath = 'Data/emgData2022_CH2.mat';
    data = load(dataPath);
catch ME
    error("Could not load the data file " + dataPath);
end

emg = data.emg;
if isempty(emg)
    error('emg data is empty');
end

sampleFreq = emg(1).sampleFreq;
recordSpan = emg(1).recordDuration;
repsAvail = width(emg(1).reps);
gestures = [emg.label];
gestureCount = length(gestures);
frameTimeSpan = 0.16;
recordLength = recordSpan*sampleFreq;
frameLength = frameTimeSpan*sampleFreq;
numFramePerRecord = floor(recordLength/frameLength);

for i = 1:gestureCount
    baseline = emg(i).baseline;
    emg(i).threshold = 2*std(baseline);
end


%% Step 6
for n = 1:gestureCount
    data = reshape(emg(n).reps, [], 1);
    %this needs work real bad :(
    frames = reshape(data(1:frameLength*numFramePerRecord*repsAvail), frameLength, numFramePerRecord*repsAvail);
    featureVectors = getFeatures(frames, emg(n).threshold);
    emg(n).featureVectors = featureVectors;
end

%% Step 7
[training, testing] = setUpExamples(emg, .20);

%% Step 8
fprintf("\nBuilt-in KNN report:\n");
model = fitcknn(training.trainingVectors, training.trainingLabels, 'NumNeighbors',15);
predictOutput = predict(model, testing.testVectors);
correctPredictions = sum(predictOutput == testing.testLables);
results = [length(training.trainingLabels), length(testing.testLables), correctPredictions];
report(results);

%% Step 9
fprintf("\nCustom KNN report:\n");
customPredictOutput = getKnnClasses(testing.testVectors, training);
customCorrectPredictions = sum(customPredictOutput == testing.testLables);
results = [length(training.trainingLabels), length(testing.testLables), customCorrectPredictions];
report(results);

%% functions
% turn this into a for-loop
function [trainingExamples, testExamples] = setUpExamples(emg, R)
    gestures = [emg.label];

    firstRepVectorFromAllGestures = [];
    firstRepLabelsFromAllGestures = [];
%     for i = 1:length(emg)
%         firstRepVectorFromAllGestures = vertcat( ...
%             firstRepVectorFromAllGestures, ...
%             emg(i).featureVectors ...
%         );
%         firstRepLabelsFromAllGestures = vertcat( ...
%              firstRepLabelsFromAllGestures, ...
%              repelem(gestures(i), length(emg(1).featureVectors)) ...
%         );
%     end

   firstRepVectorFromAllGestures = vertcat( ...
       emg(1).featureVectors, ...
       emg(2).featureVectors, ...
       emg(3).featureVectors, ...
       emg(4).featureVectors ...
   );

   firstRepLabelsFromAllGestures = [ ...
       repelem(gestures(1), length(emg(1).featureVectors)) ...
       repelem(gestures(2), length(emg(1).featureVectors)) ...
       repelem(gestures(3), length(emg(1).featureVectors)) ...
       repelem(gestures(4), length(emg(1).featureVectors)) ...
   ]';

    upper = length(firstRepVectorFromAllGestures);
    sampleCountFromPercent = fix(upper*R);
    indices = randperm(upper);

    testLabels = firstRepLabelsFromAllGestures(indices(:,1:sampleCountFromPercent));
    testVectors = firstRepVectorFromAllGestures(indices(:,1:sampleCountFromPercent),:);

    trainingLabels = firstRepLabelsFromAllGestures(indices(:,sampleCountFromPercent+1:upper));
    trainingVectors = firstRepVectorFromAllGestures(indices(:,sampleCountFromPercent+1:upper),:);
    
    trainingExamples.trainingLabels = trainingLabels;
    trainingExamples.trainingVectors = trainingVectors;
    testExamples.testLables = testLabels;
    testExamples.testVectors = testVectors;
    
end

function feats = getFeatures(dataIn, threshold)
    featureMat = [getWL(dataIn); getMAV(dataIn); getMYOP(dataIn, threshold)];
    feats = featureMat';
end

function report(results)
    totalExamples = results(1)+results(2);
    fprintf("Results of Run: %s\n", datestr(now));
    disp("=====================================");
    fprintf("Total number of Examples: %i\n", totalExamples);
    fprintf("Number of Training Examples: %i\n", results(1));
    fprintf("Number of Testing Examples: %i\n", results(2));
    disp("=====================================");
    fprintf("Total classification Accuracy: %i/%i %.2f\n", ...
        results(3), ...
        results(2), ...
        (results(3)/results(2))*100 ...
    );
end









