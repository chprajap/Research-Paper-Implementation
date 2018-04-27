%Data Communication Paper Implementation
%Title :A Modified Digital To Digital Encoding Method to Improve the 
%       Wireless Body Area Network (WBAN) Transmission.
% This is a main code for this paper implementation. It contains NRZI & MNRZI codes combined together.

%Input stream of bits to plot NRZ-I and MNRZ-I
bitSequence = input('Enter the stream of bits :');

%Default bitrate is 5
bitrate = 5;                          

%-------------- Plot of Non Return to Zero - Inverted -----------------

[t,x] = NRZI(bitSequence,bitrate);

subplot(1,2,1);
plot(t,x);
ylabel('Amplitude','fontweight','bold','fontsize',14);
xlabel('time(sec)','fontweight','bold','fontsize',14);
axis([0 t(end) -4 4]);
grid on;
title(['NRZ-I: [' num2str(bitSequence) ']']);


%-------------- Plot of Modern Non Return to Zero - Inverted -----------------


[t,x] = MNRZI(bitSequence,bitrate);

subplot(1,2,2);
plot(t,x);
ylabel('Amplitude','fontweight','bold','fontsize',14);
xlabel('time(sec)','fontweight','bold','fontsize',14);
axis([0 t(end) -4 4]);
grid on;
title(['MNRZ-I: [' num2str(bitSequence) ']']);

%------------------------- End Of Code ----------------------------------------
