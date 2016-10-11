% a function to plot 
function plotPeak(peak_period, wave_height, timestamps)
    figure
    subplot(2,1,1)
    plot(timestamps, wave_height);
    title('Graph of wave height as function of time')
    xlabel('Time')
    ylabel('Wave Height')
    datetick('x', 0)
    
    subplot(2,1,2)
    plot(timestamps, peak_period);
    title('Graph of peak period as function of time')
    xlabel('Time')
    ylabel('Peak Period')
    datetick('x', 0)
