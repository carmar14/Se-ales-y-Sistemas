clear 
close all
clc
f1=60;
f2=340;
f3=460;
fs=400;
t =0:0.0001:0.05;
subplot(3,1,1)
s1=sin(2*pi*f1*t);
s2=sin(2*pi*f2*t);
s3=sin(2*pi*f3*t);
plot(t,s1)
ylabel('Amplitud');
xlabel('Tiempo(s)');
subplot(3,1,2)
plot(t,s2)
ylabel('Amplitud');
xlabel('Tiempo(s)');
subplot(3,1,3)
plot(t,s3)
ylabel('Amplitud');
xlabel('Tiempo(s)');

%Señal discreta
Ts=1/fs;

n=0:Ts:0.05;
s1n=sin(2*pi*f1*n);
s2n=sin(2*pi*f2*n);
s3n=sin(2*pi*f3*n);
subplot(3,1,1)
title('f1=60Hz, fs=400Hz)')
hold on
stem(n,s1n)
subplot(3,1,2)
title('f2=340Hz, fs=400Hz)')
hold on
stem(n,s2n)
subplot(3,1,3)
title('f1=460Hz, fs=400Hz)')
hold on
stem(n,s3n)

%Fourier
L=length(s1);
f = (1/0.0001)*(0:(L/2))/L;
S1 = fft(s1);
P2 = abs(S1/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure
subplot(3,1,1)
plot(f,P1) 
title('Espectro de s1(t)')
xlabel('f (Hz)')
ylabel('|S1(f)|')

S2 = fft(s2);
P2 = abs(S2/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
subplot(3,1,2)
plot(f,P1) 
title('Espectro de s2(t)')
xlabel('f (Hz)')
ylabel('|S2(f)|')

% xlim([0 100])


S3 = fft(s3);
P2 = abs(S3/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
subplot(3,1,3)
plot(f,P1) 
title('Espectro de s2(t)')
xlabel('f (Hz)')
ylabel('|S3(f)|')

% http://www.eas.uccs.edu/~mwickert/ece2610/lecture_notes/ece2610_chap4.pdf





