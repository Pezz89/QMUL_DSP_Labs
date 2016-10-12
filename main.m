% Main function for running exercises
function main()
    % Parse data from text file into matlab object.
    bouydata = readbuoydata('045200603.txt');

    % Plot peak period and wave height to graphs
    %plotPeakWave(bouydata.Tp, bouydata.Hs, bouydata.date)

    % Apply moving average filter to 
    plotPeakMovingAverage(bouydata);

function plotPeakMovingAverage(bouydata)
    % Unpack object into variables.
    peak_period = bouydata.Tp;
    timestamps = bouydata.date;

    % Apply moving average filter with M = 5, 21 and 51 to peak period data.
    ma5 = movingAverage(peak_period, 5);
    ma21 = movingAverage(peak_period, 21);
    ma51 = movingAverage(peak_period, 51);
    
    figure
    subplot(3,1,1)
    plot(timestamps, peak_period, 'color', [0.8 0.8 0.8])
    hold on;
    plot(timestamps, ma5);
    title('M = 5')
    xlabel('Time')
    ylabel('Peak Period')
    datetick('x', 0)


    subplot(3,1,2)
    plot(timestamps, peak_period, 'color', [0.8 0.8 0.8])
    hold on;
    plot(timestamps, ma21);
    title('M = 21')
    xlabel('Time')
    ylabel('Peak Period')
    datetick('x', 0)

    subplot(3,1,3)
    plot(timestamps, peak_period, 'color', [0.8 0.8 0.8])
    hold on;
    plot(timestamps, ma51);
    title('M = 51')
    xlabel('Time')
    ylabel('Peak Period')
    datetick('x', 0)
