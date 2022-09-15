function feats = getMYOP(signalSet, a)
% getMYOP Compute Myopulse (MYOP) of signal.

myop = abs(signalSet);
myop = myop() >= a;
myop = sum(myop);
feats = myop;
