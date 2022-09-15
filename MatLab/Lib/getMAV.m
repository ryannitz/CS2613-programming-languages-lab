function feats = getMAV(signalSet)
% getMAV Compute Mean Absolute Value (MAV) of signal.

N=size(signalSet, 1);
mav = sum(abs(signalSet))/N;
feats = mav;
