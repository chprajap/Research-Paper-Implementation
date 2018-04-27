%This file contains a code for NRZI digital to digital encoding method
%-------------- Plot of Non Return to Zero - Inverted -----------------


function [t,x] = NRZI(bitSequence,bitrate)

T = length(bitSequence)/bitrate;             %Full Time of bit sequence
n = 200;                                     %For making signal as a straight line
N = n*length(bitSequence);                   %total values to plot(To get perfect DC signal)
dt = T/N;                                    %Small time dt
t = 0:dt:T;                                  %Increment in small intervals
x = zeros(1,length(t));                      %Output Signal
valueToAssign = 1;                           %Current signal level to assign
var = 1;

%------- Code to plot the Non Return To Zero inverted -------
for i = 0:length(bitSequence)-1
    
  %If the current bit is one, the level of the signal is inverted
  %else the level of signal remains same
  if bitSequence(i+1) == 1
        valueToAssign = -1*valueToAssign;
  end
  
  %Assign the value got as per the bit sequence.
  x(i*n+1:(i+1)*n) = valueToAssign;
end

%----------------------------- End Of Code -----------------------------