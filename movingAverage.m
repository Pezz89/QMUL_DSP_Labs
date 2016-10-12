function [outputSignal] = movingAverage(inputSignal, M)
    % Initialize output array with zeros.
    outputSignal = zeros(1, length(inputSignal));
    % Pad input with zeros at the begining.
    inputSignal = [zeros(1, M-1), inputSignal];

    % For each sample in input...
    for n = M:length(inputSignal)
        % Take the last M samples and save their mean value as the output sample.
        outputSignal(n-M+1) = mean(inputSignal(n-M+1:n));
    end
        

