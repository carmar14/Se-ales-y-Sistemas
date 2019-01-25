clear 
clc
close all
[y fs]=audioread('acusticos_3.mp3');
% [y fs]=audioread('guitarra.wav');
% [y fs]=audioread('piano.wav');
% [y fs]=audioread('tambor.mp3');
% [y fs]=audioread('tambor-militar.mp3');
% [y fs]=audioread('Hola.wav');
% [y fs]=audioread('Tonleiter_c-dur.mid');
%sound(y,fs)
y=y(:,1);
t=0:1/fs:length(y)/fs-1/fs;
plot(t,y)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Original')

%Analisis del sonido
Y=fft(y);
L=length(Y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
figure
plot(f,P1)
xlabel('Frecuencia')
ylabel('Amplitud')
title('Sonido Original')

%Seleccion de armonicos,fases y amplitudes
[m i]=max(P1);
P2 =Y/L;
P3 = P2(1:L/2+1);
P3(2:end-1) = 2*P3(2:end-1);

n=5;%numero de armonicos
for o=1:n
    ar(o)=f(o*i);
    am(o)=P1(o*i);
    fase(o)=atan(imag(P3(o*i))/real(P3(o*i)));
    
end 

%Encontrando la envolvente

env = abs(hilbert(y));
[up,lo] = envelope(y,200,'rms');
figure
plot(t,[-1;1]*env')
xlabel('Tiempo')
ylabel('Amplitud')
title('Envolvente Sonido Original')

figure
plot(t,y,t,up,t,lo)
%Recrear sonido
yn=0;
for i=1:length(ar)
    yn=yn+am(i)*cos(2*pi*ar(i)*t+fase(i));
end
figure
plot(t,yn)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Sintetizado sin envolvente')

yenv=yn.*env';
% yenv=yn.*up';
yenv=yenv/max(yenv);
figure
plot(t,yenv)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Sintetizado con envolvente')
% sound(yenv,fs)

%Comparacion
%e=abs(yenv-y);
figure
plot(t,yenv)
hold on
plot(t,y)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Comparado')

figure

spectrogram(y,125,2,250,fs,'yaxis');

figure

spectrogram(yn,125,2,250,fs,'yaxis');

figure

spectrogram(yenv,125,2,250,fs,'yaxis');

%Implementacion de efecto Wah-Wah
damp = 0.05; 
minf=100;%500; 
maxf=6000;%3000; 
Fw = 500;%2000;
Fs=fs;
Q1 = 2*damp;
Fc = minf;
x=y;

F1 = 2*sin((pi*Fc)/Fs);
ynew(1) = F1*x(1);
yl = F1*ynew(1);
yaux = ynew(1);
delta = Fw/Fs;
for n=2:length(x),
    if Fc + delta > maxf | Fc + delta < minf 
        delta =  -delta;
    end
    Fc = Fc+ delta;
    F1 = 2*sin((pi*Fc)/Fs);
    yh = x(n)-yl-Q1*yaux;
    ynew(n) = F1*yh+yaux;
    yl=F1*ynew(n)+yl;
    yaux=ynew(n);
end
maxy = max(abs(ynew));
yf = ynew/maxy;

sound(yf,fs)

figure
plot(t,yf)

%Implementacion de efecto vibrato
% SAMPLERATE=fs;
% Modfreq=2000;
% Width=50;
% ya_alt=0;
% Delay=Width; % basic delay of input sample in sec
% DELAY=round(Delay*SAMPLERATE); % basic delay in # samples
% WIDTH=round(Width*SAMPLERATE); % modulation width in # samples
% % if WIDTH>DELAY
% % error('delay greater than basic delay !!!');
% % return;
% % end;
% MODFREQ=Modfreq/SAMPLERATE; % modulation frequency in # samples
% LEN=length(x); % # of samples in WAV-file
% L=2+DELAY+WIDTH*2; % length of the entire delay
% Delayline=zeros(L,1); % memory allocation for delay
% y=zeros(size(x)); % memory allocation for output vector
% 
% for n=1:(LEN-1)
% n
% M=MODFREQ;
% MOD=sin(M*2*pi*n);
% ZEIGER=1+DELAY+WIDTH*MOD;
% i=floor(ZEIGER);
% frac=ZEIGER-i;
% Delayline=[x(n);Delayline(1:L-1)];
% %---Linear Interpolation-----------------------------
% y(n,1)=Delayline(i+1)*frac+Delayline(i)*(1-frac);
% %---Allpass Interpolation------------------------------
% %y(n,1)=(Delayline(i+1)+(1-frac)*Delayline(i)-(1-frac)*ya_alt);
% %ya_alt=ya(n,1);
% end
% 
% %y=[yenv yenv];
% sound(y,fs)


