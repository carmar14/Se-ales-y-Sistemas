clc
clear 
close all
load filtro
num=FIRbp.tf.num;
den=FIRbp.tf.den;
h=num;
[y Fs]=audioread('Hola.wav');
y=y(:,1);
Ts=1/Fs;
L=length(y);
t=0:Ts:L*Ts-Ts;
plot(t,y)
title('Señal Original')
%sound(y,Fs);
%pause(2)
f1=300;
f2=13000;
f3=100;
ruido=0.5*(sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f2*5*t))';
yr=y+ruido;
% sound(ruido,Fs);
% pause(2)
figure
plot(t,yr)
title('Señal Contaminada')

%Espectro
% df = Fs / L;
% w = (-(L/2):(L/2)-1)*df;
% yf = fft(yr(:,1), L) / L; % For normalizing, but not needed for our analysis
% y2 = fftshift(yf);
% figure;
% plot(w,abs(y2));

%Filtrado

% % n = 7;
% % beginFreq = 600 / (Fs/2);
% % endFreq = 8000 / (Fs/2);
% % [b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(num,den, yr);
fOut=conv(h,yr);
l=length(h)+length(yr)-1;
hi=[zeros(1,l) h(end:-1:1)]; %respuesta al impulso al reves
%hi=[h zeros(1,length(yr)-length(h))]';
yr=[yr' zeros(1,l)];
sf=zeros(l,1);
m=length(yr);
n=length(h);
% Y=[yr zeros(1,L-m)];
% H=[h zeros(1,L-n)];
% length(H)
% length(Y)
% length(sf)
j=0;
for i=1:l
   ha=hi(end:-1:length(hi)-j);
   ha=ha(end:-1:1);
   sf(i)=yr(1:i)*ha';
   j=j+1;
end

    




%% Construct audioplayer object and play
p = audioplayer(fOut, Fs);
p.play;

figure
tn=0:Ts:length(fOut)*Ts-Ts;
plot(tn,fOut)
figure
plot(tn,sf)

