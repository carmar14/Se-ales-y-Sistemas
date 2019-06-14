clear
close all
clc
% [y fs]=audioread('acusticos_3.mp3');
%[y fs]=audioread('tambor-militar.mp3');
%[y fs]=audioread('guitarra.wav');
[y fs]=audioread('piano.wav');
% [y fs]=audioread('tambor.mp3');
y=y(:,1);
y=y(1:length(y)/3);
n=0:1/fs:length(y)/fs-1/fs;
sound(y,fs)
figure()
plot(n,y)
pause(n(end)+1)


figure
plotfft(y,fs)

%% sintesis aditiva

% fs=44100;
% n=0:1/fs:1;
%Analisis del sonido
Y=fft(y);
L=length(Y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f1 = fs*(0:(L/2))/L;
%Seleccion de armonicos,fases y amplitudes
[m i]=max(P1);
P2 =Y/L;
P3 = P2(1:L/2+1);
P3(2:end-1) = 2*P3(2:end-1);

na=5;%numero de armonicos
for o=1:na
    ar(o)=f1(o*i);
    am(o)=P1(o*i);
    fase(o)=atan(imag(P3(o*i))/real(P3(o*i)));
    
end 

yn=0;
for i=1:length(ar)
    yn=yn+am(i)*cos(2*pi*ar(i)*n+fase(i));
end

f=ar(1);
fp=5*f;

s1=am(1)*cos(2*pi*ar(1)*n+fase(1));%sin(2*pi*f*n);
s2=am(2)*cos(2*pi*ar(2)*n+fase(2));%0.7*sin(2*pi*2*f*n);
s3=am(3)*cos(2*pi*ar(3)*n+fase(3));%0.5*sin(2*pi*3*f*n);
% sr=s1+s2+s3;
sr=yn;
figure
subplot(421);plot(n,s1);ylim([-2 2]);xlim([0 0.04]);title('s1')
subplot(423);plot(n,s2);ylim([-2 2]);xlim([0 0.04]);title('s2')
subplot(425);plot(n,s3);ylim([-2 2]);xlim([0 0.04]);title('s3')
subplot(427);plot(n,sr);ylim([-2 2]);xlim([0 0.04]);title('sumatoria')
subplot(422);plotfft(s1,fs)
subplot(424);plotfft(s2,fs)
subplot(426);plotfft(s3,fs)
subplot(428);plotfft(sr,fs)

%Encontrando la envolvente

env = abs(hilbert(y));
[up,lo] = envelope(y,200,'rms');
out=sr.*env';
out=out/max(abs(out));
figure
plot(n,out)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Sintetizado aditiva con envolvente')

% %Envolvente sintetica
% [env,Tt]=ADSR(20,100,0.7,200,100,fs);
% figure
% subplot(121);plot(env);title('Envolvente ADSR')
% out=env.*sr(1:Tt);
% % out=[out]
% subplot(122);plot(out);title('sonido sintetico')
sound(out,fs)

pause(n(end)+1)


%% sintesis substractiva

% fs=44100;
% n=0:1/fs:1;
s=sawtooth(2*pi*f*n);%sawtooth(2*pi*500*n);
s=square(2*pi*f*n);
b=[1 2 1];
a=[1 -1.8 0.9];
N=8;
Fc=4*f;
[b,a]=butter(N,Fc/(fs/2)); 

y=filter(b,a,s);
figure
subplot(421);plot(n,s);xlim([0 0.04]);title('onda compleja')
subplot(425);plot(n,y);xlim([0 0.04]);title('filtrada')
subplot(422);plotfft(s,fs)
subplot(426);plotfft(y,fs)
out=y.*env';
out=out/max(abs(out));
figure
plot(n,out)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Sintetizado substractica con envolvente')
sound(out,fs)
pause(n(end)+1)

%% RM

% fs=44100;
% n=0:1/fs:1;
% fp=10000;
% fp=4000;

sp=sin(2*pi*fp*n);
sm=sin(2*pi*f*n);;%sin(2*pi*1000*n);
sr=sp.*sm;
figure
subplot(321);plot(n,sp);ylim([-2 2]);xlim([0 0.04]);title('portadora')
subplot(323);plot(n,sm);ylim([-2 2]);xlim([0 0.04]);title('moduladora')
subplot(325);plot(n,sr);ylim([-2 2]);xlim([0 0.04]);title('RM')
subplot(322);plotfft(sp,fs)
subplot(324);plotfft(sm,fs)
subplot(326);plotfft(sr,fs)
out=sr.*env';
out=out/max(abs(out));
figure
plot(n,out)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Sintetizado RM con envolvente')
sound(out,fs)
pause(n(end)+1)
 
%% AM

% fs=44100;
% n=0:1/fs:1;
% fp=10000;
% fp=4000;
sp=sin(2*pi*fp*n);
sm=sin(2*pi*f*n);%sin(2*pi*3000*n);
sr=sp.*(1+sm);
figure
subplot(321);plot(n,sp);ylim([-2 2]);xlim([0 0.04]);title('portadora')
subplot(323);plot(n,sm);ylim([-2 2]);xlim([0 0.04]);title('moduladora')
subplot(325);plot(n,sr);ylim([-2 2]);xlim([0 0.04]);title('AM')
subplot(322);plotfft(sp,fs)
subplot(324);plotfft(sm,fs)
subplot(326);plotfft(sr,fs)
out=sr.*env';
out=out/max(out);
figure
plot(n,out)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Sintetizado AM con envolvente')
sound(out,fs)
pause(n(end)+1)

%% FM

% fs=44100;
% n=0:1/fs:1;
% fp=10000;
% fp=4000;
I=25;
sp=sin(2*pi*fp*n);
sm=sin(2*pi*f*n);%sin(2*pi*5000*n);
sr=sin(2*pi*fp*n+I*sm);
figure
subplot(321);plot(n,sp);ylim([-2 2]);xlim([0 0.04]);title('portadora')
subplot(323);plot(n,sm);ylim([-2 2]);xlim([0 0.04]);title('moduladora')
subplot(325);plot(n,sr);ylim([-2 2]);xlim([0 0.04]);title('FM')
subplot(322);plotfft(sp,fs)
subplot(324);plotfft(sm,fs)
subplot(326);plotfft(sr,fs)
out=sr.*env';
out=out/max(out);
figure
plot(n,out)
xlabel('Tiempo')
ylabel('Amplitud')
title('Sonido Sintetizado FM con envolvente')
sound(out,fs)
pause(n(end)+1)
 
%% waveshaping

% Fs=44100;  % define frec de muestreo
% Ts=1/Fs;   % calcula periodo de muestreo
% t=0:Ts:(1-Ts); % crea un vector de tiempos 
% f=5;   % define frecuencia
% in=sin(1000*pi*f*t); %sintetiza la onda sin
% TH=0.7;
% for i=1:length(in)
%     if in(i)>=TH
%         out(i)=TH;
%     elseif in(i)<=-TH
%         out(i)=-TH;
%     else
%         out(i)=in(i);
%     end
% end
% subplot(321);plot(in(1:100));ylim([-1 1]);title('in')
% subplot(325);plot(out(1:100));ylim([-1 1]);title('out')
% subplot(322);plotfft(in,Fs,1)
% subplot(326);plotfft(out,Fs,1)
% subplot(323);plot(out,in);title('Funcion de transferencia in/out')
