function [ output_args ] = plotfft( s,fs )
%PLOTFFT Summary of this function goes here
%   Detailed explanation goes here
L=length(s);
Y=fft(s);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f=fs*(0:(L/2))/L;
plot(f,P1)

end

