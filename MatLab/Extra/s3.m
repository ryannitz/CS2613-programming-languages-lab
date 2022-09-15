clear; clc;
addpath('Data\');
data = load('emgData2022_CH2.mat');
emg = data.emg;

%% Flexion type to frame/analyze
desiredFlex = 'WristFlexion';
desiredRep = 2; %second rep
labels = [emg.label];
rowMatched = ismember(labels, desiredFlex);
rowData = emg(rowMatched);
reps = rowData.reps;
rep = reps(:,desiredRep);

%% frame graph params
frameLength = 160;
sf = 1000;
f = figure;

%% framing the rep
dataLength = length(rep);
numFrames = fix(dataLength/frameLength); %rename val
trimmedData = rep(1:(frameLength*numFrames));
frames = reshape(trimmedData,[],numFrames);

%% MAV plot
%graph data for mav
plotData = getMAV(frames);
subplot(3,1,1);
plot(plotData, 'b*');
xlabel('Mean Absolute Value vs Frame for repetition '+string(desiredRep)+' of '+string(desiredFlex));
ylabel('Volts');

%% WL plot
%graph data for mav
plotData = getWL(frames);
subplot(3,1,2);
plot(plotData, 'b*');
xlabel('Wave vs Frame for repetition '+string(desiredRep)+' of '+string(desiredFlex));
ylabel('Volts');

%% MYOP plot
threshold = 0.1;
%graph data for mav
plotData = getMYOP(frames, threshold);
subplot(3,1,3);
plot(plotData, 'b*');
xlabel('Myopulse vs Frame for repetition '+string(desiredRep)+' of '+string(desiredFlex)+' th='+string(threshold));
ylabel('Volts');


%% getFeatures local function
%test
testGetFeatures = getFeatures(frames, 0.22);
function feats = getFeatures(dataIn, threshold)
featureMat = [getWL(dataIn); getMAV(dataIn); getMYOP(dataIn, threshold)];
feats = featureMat';
end


