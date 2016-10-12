% a function to plot 
function plotPeakWave(peak_period, wave_height, timestamps)
    % Create a new figure window
    figure
    % Split the figure into two seperate graphs and set preceeding plot
    % functions to work on top graph.
    subplot(2,1,1)
    % Plot time data to x axis and wave height data to y axis.
    plot(timestamps, wave_height);
    % Add a title to the graph
    title('Graph of wave height as function of time')
    % Label the x axis as 'time'
    xlabel('Time')
    % Label the y axis as 'wave height'
    ylabel('Significant Wave Height (m)')
    % format time data to use 'dd-mmm-yyyy HH:MM:SS'
    datetick('x', 0)
    
    % Set future plot functions to act on second plot
    subplot(2,1,2)
    % Same as above, but with peak period in place of wave height...
    plot(timestamps, peak_period);
    title('Graph of peak period as function of time')
    xlabel('Time')
    ylabel('Peak Period (s)')
    datetick('x', 0)
