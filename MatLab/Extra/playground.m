clear; clc;

data = load('Data/emgDataFS1KT3REP4.mat');

recordspan = 3; %seconds
sf = 1000; %frequency
dt = 1/sf;
t = 0:dt:recordspan-dt;


f = figure;

%for index = 1:4
%    plot(t, data.emg(t<recordspan,index))
%    subplot(4,1,index);
%    xlabel('time (s)')
%    ylabel('wavelength')
%end

subplot(4,1,1);
plot(t, data.emg(t<recordspan,1))
xlabel('time (s)')
ylabel('wavelength')

subplot(4,1,2);
plot(t, data.emg(t<recordspan,2))
xlabel('time (s)')
ylabel('wavelength')

subplot(4,1,3);
plot(t, data.emg(t<recordspan,3))
xlabel('time (s)')
ylabel('wavelength')

subplot(4,1,4);
plot(t, data.emg(t<recordspan,4))
xlabel('time (s)')
ylabel('wavelength')

%% threshold
A = [1 2 2 3 4 5 6 7 8]
B = A(A() > 3)





