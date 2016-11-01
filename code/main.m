% Main function for running exercises
function main()
    % Declare the number of samples in the sine wave
    N = 32;
    % Declare the sample rate
    fs = 2048;
    % Create indexes 1 - N
    time = [1:N];
    % Declare the frequency as 128Hz
    frequency = 128;
    % Declare the amplitude
    amplitude = 1.0;

    % Generate signal x from parameters
    x = amplitude * sin(2*pi*frequency*(time/2048));

    % plot x to lollipop graph
    stem(x)


