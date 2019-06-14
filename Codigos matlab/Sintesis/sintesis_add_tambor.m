clear 
clc
close all
[y fs]=audioread('tambor-militar.mp3');
%sound(y,fs)
t=0:1/fs:length(y)/fs-1/fs;
plot(t,y)


%Analisis del sonido
Y=fft(y);
L=length(Y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
figure
plot(f,P1) 

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
figure
plot(env)

%Recrear sonido
yn=0;
for i=1:length(ar)
    yn=yn+am(i)*sin(2*pi*ar(i)*t+fase(i));
end
figure
plot(t,yn)

yenv=yn.*env';
yenv=yenv/max(yenv);
figure
plot(t,yenv)
sound(yenv,fs)

%Comparacion
%e=abs(yenv-y);
figure
plot(t,yenv)
hold on
plot(t,y)


