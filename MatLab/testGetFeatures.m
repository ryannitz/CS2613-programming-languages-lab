% Setup
A = [1 2; 1 4; 5 3];
B=[];
C=4;

%% Test 1: WL for two-frames
expected = [4 3];
assert(isequal(getWL(A), expected));

%% Test 2: WL for three-frames
expected=[1 3 2];
assert(isequal(getWL(A'), expected));

%% Test 4: WL for scalar
assert(isequal(getWL(C), 0));

%% Test 3: WL for empty matrix
assert(isempty(getWL([])));

%% Test 5: MAV for two-frames
expected = [7/3, 3.0];
assert(isequal(getMAV(A), expected))
%% Test 6: MYOPULSE for two-frames
expected = [1, 2];
assert(isequal(getMYOP(A, 3), expected))


