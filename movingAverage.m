function [outputSignal] = movingAverage(inputSignal, M)
    outputSignal = zeros(length(inputSignal));
    % Pad input with zeros at the begining.
    inputSignal = [zeros(1, M-1), inputSignal];

    for n = M:length(inputSignal)
        n
        M
        outputSignal(n-M+1) = mean(inputSignal(n-M+1:n));
    end
        

