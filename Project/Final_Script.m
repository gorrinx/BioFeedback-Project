%% Biofeedback Loop Script for Guided Breathing Session (HRV Readout)
% Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["time", "amplitude"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("C:\Users\Gorrin\Desktop\Signals and Systems Matlab\Project\Patient1.csv", opts);

% Convert to output type
time = tbl.time;
amplitude = tbl.amplitude;

% Clear temporary variables
clear opts tbl

%% Feature Extraction of EKG Data
%Extrapolate peaks (local maxes) from vector 'amplitude' and set a minimum
%peak amplitude.
pks = findpeaks(amplitude,'MinPeakHeight',67);

%Determine the indices in the 'pks' vector. Match the indices to the
%corresponding time points on the EKG.
[pks,locs]= findpeaks(amplitude,'MinPeakHeight',67);
x = time(locs);

%Create a vector with the time differences of each peak (R-R Intervals).
RRInterval= diff(x);

%Define the length and indices of vector 'RRInterval'
P = length(RRInterval);
i = 1;

%% Poincare Plot for HRV Visualization
%Plot a dot plot of the values in the 'RRIntervals' on the x-axis and its
%adjcent value on the y-axis.
for i=1:(P-1)
    plot(RRInterval(i),RRInterval(i+1),'+');
    hold on
    title('Poincare plot');
    xlabel('R-R Interval (n)');
    ylabel('R-R Interval (n+1)');
end

