clear 
close all
clc


f = input ('Enter the analog frequencies: ');
 fs = input ('Enter the Sampling frequency: ');
 Ts = 1/fs;
 Ns = 512
 t = [0:Ts:Ts*(Ns-1)];
 x = sin(2*pi*f*t);
 X = fft(x,Ns)/Ns;
 xdft = fftshift(X);
 fc = f;
df = fs/Ns;
f = -fs/2:df:fs/2-df;
 plot(f,abs(xdft))