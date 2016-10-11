% Declare a function that takes a signle argument (the file path) and returns a
% 'data' object containing the data parsed from the file object. A count
% integer is also returned with the number of entries read from file.
function [data, count] = readbuoydata(datafile)

    % Create a file object with the path provided by the 'datafile' variable
    fid = fopen(datafile,'r');
    % Read first two header lines of file so that they are ignored in
    % processing below.
    tline = fgetl(fid);
    tline = fgetl(fid);

    % Parse each line of the file from line 3 onwards and store in variable 'A'
    % first argument specifies the file object.
    % second arguments specifies the data type to expect for each of the 10
    % elements per line.
    % the third argument specifies to read 10 elements per line, and to read
    % until the end of the file.
    [A,count] = fscanf(fid,'%d %d %d %d %d %f %f %d %f %f',[10 inf]);

    % Creates a member of the data object that contains dates in the 'serial
    % date number' format
    data.date = datenum([A(1:5,:); zeros(1,size(A,2))]')';
    data.Hs = A(6,:); % significant wave height
    data.Tp = A(7,:); % peak period
    data.Dp = A(8,:); % peak period direction
    data.Ta = A(9,:); % average period
    data.SST = A(10,:); % sea surface temperature

    % Close the file 
    fclose(fid);
