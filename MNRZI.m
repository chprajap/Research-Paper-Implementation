% This file contains a code for MNRZI digital to digital encoding method

%-------------- Function to plot Modern Non Return to Zero - Inverted -----------------

function [t,x] = MNRZI(bitSequence,bitrate)

T = length(bitSequence)/bitrate;             %Full Time of bit sequence
n = 200;                                     %For making signal as a straight line
N = n*length(bitSequence);                   %total values to plot(To get perfect DC signal)
dt = T/N;                                    %Small time dt
t = 0:dt:T;                                  %Increment in small intervals
x = zeros(1,length(t));                      %Output Signal
valueToAssign = 1;                           %Current signal level to assign
prevTwoZeroCount=0;                          %Variable to maintain the previous zero count
previous = 1;

%------- Code to plot the Modern Non Return To Zero inverted -------

%Traversing full length of bit sequence
for i = 0:length(bitSequence)-1
  
    %If previous Two and current bits is zero, make the third
    %bit synchronous and continue from the next bit.
    if prevTwoZeroCount == 2 && bitSequence(i+1) == 0
           x(i*n+1:(i+0.5)*n) = valueToAssign;
           valueToAssign = -1 * valueToAssign;
           x((i+0.5)*n+1:(i+1)*n) = valueToAssign;
           prevTwoZeroCount = 0;
           continue;
    end
    
    %If the current bit is zero then increment the prevTwoZeroCount by 1
    %The level of the signal remain same
    if bitSequence(i+1) == 0
          prevTwoZeroCount = prevTwoZeroCount + 1;
    end
  
    %If the current bit is one then make the prevTwoZeroCount 0.
    %As the current bit is one the level of the signal is inverted.
    if bitSequence(i+1) == 1
        prevTwoZeroCount=0;
        valueToAssign = -1*valueToAssign;
    end
   
  %Assign the value got as per the bit sequence.   
  x(i*n+1:(i+1)*n) = valueToAssign;
end


%----------------------------- End Of Code -----------------------------