clear; clc;
addpath('Data\');
data = load('emgDataFS1KT3REP4.mat');
sf = 1000;


%% data graph params
data_recordspan = 3; %seconds
data_dt = 1/sf;
data_t = 0:data_dt:data_recordspan-data_dt;

%% framing the data
frameLength = 160;
dataLength = length(data.emg);
numFrames = fix(dataLength/frameLength); %rename val
trimmedData = data.emg(1:(frameLength*numFrames));
frames = reshape(trimmedData,[],numFrames);

%% frame graph params
frame_recordspan = frameLength/sf; %seconds (3/18) or (160/1000)?
frame_dt = 1/sf;
frame_t = 0:frame_dt:frame_recordspan-frame_dt;


f = figure;
subplot(2,1,1);
plot(data_t, data.emg(data_t<data_recordspan,1))
xlabel('time (s)')
ylabel('volts')

subplot(2,1,2);
frameToPlot = 1; % 1 to 18
plot(frame_t, frames(frame_t<frame_recordspan,frameToPlot));%choose a random frame (1)
xlabel('time (s)');
ylabel('frame ('+string(frameToPlot)+') volts');



