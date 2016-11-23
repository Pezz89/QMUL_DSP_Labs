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
    zero_p = length(X2) / length(X);
    b = [1 zeros(1,zero_p-1)];
    X = kron(X, b);
    X(X == 0) = NaN;

    N = 31;
    tri_win = (((N-1.0)/2.0)-abs((0:N-1)-((N-1.0)/2.0)))*(2.0/(N-1.0));
    % tri_win
    N = 32;
    rect_win = ones(N);
    sine_win = sin(pi*(0:N-1)/(N-1));
    hann_win = 0.5*(1-cos(2*pi*(0:N-1)/(N-1)));
    figure;
    X = fft(sine_win, 1024);
    X = fftshift(X);
    X = 20*log10(abs(X)/max(abs(X)));
    max(X(437:460))

    % [m, im] = min(X(459:467));
    % %op1 = (im + 459) / 1024.;
    % op1 = im + 459
    % [m, im] = min(X(556:568));
    % %op2 = (im + 556) /1024.;
    % op2 = im + 556
    % op2 - op1

    plot(X)
    hold on;
    axis([int64((1024/2.)-(1024*0.2)), int64((1024/2.)+(1024*0.2)), -80, 5]);
    X = fft(hann_win, 1024);
    X = 20*log10(abs(X)/max(abs(X)));
    X = fftshift(X);
    max(X(418:445))
    % [m, im] = min(X(446:457));
    % %op1 = (im + 446) / 1024.;
    % op1 = im + 446;
    % [m, im] = min(X(574:584));
    % %op2 = (im + 574) /1024.;
    % op2 = im + 574;
    % op2 - op1

    plot(X, '--r')
    %axis([-0.2, 0.2, -80, 5]);
    set(gca,'XTickMode','manual');
    set(gca,'XTick',int64([(1024/2.)-(1024*0.2), 512, (1024/2.)+(1024*0.2)]));
    set(gca,'XtickLabels', [-0.2, 0, 0.2]);
    legend('Sine','Hann')
    return;

    hold on;
    plot(tri_win, 'b')
    plot(hann_win, 'r')
    plot(sine_win, 'g')
    plot(rect_win, 'c')
    axis([-1, 33, 0, 1.1])

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
