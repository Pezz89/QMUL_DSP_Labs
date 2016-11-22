% Main function for running exercises
function main()
    % Declare the number of samples in the sine wave
    N = 32;
    % Declare the sample rate
    fs = 2048;
    % Create indexes 1 - N
    time = [0:N-1];
    % Declare the frequency as 128Hz
    frequency = 128;
    % Declare the amplitude
    amplitude = 1.0;

    % Generate signal x from parameters
    x = 1*sin(2*pi*128*(time/fs)) + 0.2*sin(2*pi*220*(time/fs)) + ...
    0.01*cos(2*pi*525*(time/fs));

    % Compute the DFT of the sine wave
    X = fft(x);
    
    % Pad with zeros to make vector 2048 samples long
    X2 = fft([x, zeros(1, 2048-N)]);


    % Calculate absolute magnitude of spectrum
    X = abs(X);
    X2 = abs(X2);

    % Zero pad smaller vector so they are the same sie for plotting
    % Kronecker padding technique taken from: http://stackoverflow.com/questions/11776251/inserting-variable-number-of-zeros-between-non-zero-elements-in-a-vector-in-matl
    zero_p = length(X2) / length(X)
    b = [1 zeros(1,zero_p-1)];
    X = kron(X, b)
    X(X == 0) = NaN

    N = 31
    tri_win = (((N-1.0)/2.0)-abs((0:N-1)-((N-1.0)/2.0)))*(2.0/(N-1.0))
    % tri_win
    % N = 32
    % rect_win = 
    % sine_win = 
    % hann_win = 
    plot(tri_win)
    return;

    figure

    % Plot the absolute magnitude of the DFT to a graph
    stem(X(1:2048/2));
    hold on
    plot(X2(1:2048/2));
    % Set xlabel to show bin 10 bin indexes
    set(gca,'XTickMode','manual');
    set(gca,'XTick',int64((1:10)*(1024/10)));
    set(gca,'XtickLabels',int64((1:10)*((fs/2)/10)));


    % Turn on grid
    grid on;
    
    % Add a title to the graph
    title('DFT of x')
    
    % Label the x axis as 'Frequency'
    xlabel('Bin Index')
    % Label the y axis as 'Magnitude'
    ylabel('Magnitude |X|')
