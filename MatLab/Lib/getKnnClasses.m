function prediction = getKnnClasses(testVectors, trainingExamples)
%GETKNNCLASSES Summary of this function goes here
%   Detailed explanation goes here
predictionSet = [];
    for i = 1:length(testVectors)
        testVectorNeighbors = getNeighbors(testVectors(i,:), trainingExamples, 15);
        predictionSet = vertcat(predictionSet, talleyNeighbors(testVectorNeighbors));
    end
    prediction = predictionSet;
end


function classDecision =  talleyNeighbors(closestNeighbors)
    classPredictions = closestNeighbors(:,1);
    [s,~,j] = unique(classPredictions);
    classDecision = s(mode(j));
end


function neighbors = getNeighbors(testVector, examples, N)
    differenceVector = [];
    for i = 1:length(examples.trainingVectors)
        distance = norm(examples.trainingVectors(i,:) - testVector);
        differenceVector = vertcat(differenceVector, distance);
    end
    %Another beautiful use of mapping the sorted data
    [~,x] = sort(differenceVector);
    sortedLabelDifferenceVector = [examples.trainingLabels(x,:) examples.trainingVectors(x,:)];
    neighbors = sortedLabelDifferenceVector(1:N,:);
end