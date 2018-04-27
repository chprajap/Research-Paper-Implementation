% This file contains code for main Plot which integrates both NRZIPLOT.m & MNRZIPLOT.m files and will plot the graph.
% The graph obtaned here will be in a new window & it will contain 2 plots .
% Left plot will be NRZI DC Component Average plot
% Right plot will be MNRZI DC Component Average plot

      % Variable for holding bitrate
bitRate = 5; 

      % Calling function NRZIPLOT For plotting where i is X axis scale & plot1 is Y axis scale
[i,plot1] = NRZIPLOT(bitRate);

      % Variable for storing the Final Average DC component for NRZI
finalAvgComponent = 0;

      % finding Average DC Component for NRZI
for k=1:2000
    finalAvgComponent =  finalAvgComponent + plot1(k);
end

finalAvgComponent = finalAvgComponent/2000;

      % Plotting graph as a subplot containing 2 plots in one row for NRZI
subplot(1,2,1);
plot(i,plot1,'r'); 
axis([0 2000 -40 40]);                                                    % defining axis
title([ 'NRZI DC Component Average :' num2str(finalAvgComponent) ]);      % defining title of graph


      % Calling function MNRZIPLOT For plotting where i is X axis scale & plot1 is Y axis scale
[j,plot2] = MNRZIPLOT(bitRate);

      % Variable for storing the Final Average DC component for MNRZI
finalAvgComponent = 0;

      % finding Average DC Component for MNRZI
for i=1:2000
    finalAvgComponent =  finalAvgComponent + plot2(i);
end

finalAvgComponent = finalAvgComponent/2000;

      % Plotting graph as a subplot containing 2 plots in one row for MNRZI
subplot(1,2,2);
plot(j,plot2,'b');
axis([0 2000 -50 50]);                                                    % defining axis
title([ 'MNRZI DC Component Average :' num2str(finalAvgComponent)]);      % defining title of graph
