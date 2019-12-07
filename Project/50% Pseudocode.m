%Updated Biofeedback Loop for Heart Rate Variability (50% Project Point)

%Receive input data from a sample electrocardiogram data.

S = readtable('mytable.csv');

%Create input vectors time(milliseconds) and millivolts

t = S(:,1);
mv = S(:,2);

%Extrapolate peaks (local maxes) from vector mv and 

findpeaks(mv,Fs,'MinPeakHeight',0.5); %Chooses all local maxes that have a minimum amplitude of 0.5 mV. Useful for noisy data.

%Measure the distances between the peaks, known as R-R intervals, and
%create an output vector.

findpeaks(mv,t,'MinPeakProminence',1500); %Using 1500 milliseconds as cutoff.

[rr] = findpeaks(mv,t,'MinPeakProminence',1500); %Output vector creation

%Define the length and indices of vector rr containing R-R intervals.

P = length(rr);
i = 1;

%Plot a Poincare plot as an HRV visualization.

for i=1:P
   plot(rr(i),rr(i+1));
end
