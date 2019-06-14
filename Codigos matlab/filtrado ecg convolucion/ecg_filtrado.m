clc
clear
close

load('a01mod.mat')
load('filtro.mat')
ecg=val*0.5e-3;
ts=1/100;
fs=1/ts;
t=0:ts:length(ecg)*ts-ts;
subplot(3,1,1)
plot(t,ecg)
grid on
title('ECG');
ylabel('Amplitud mV');
xlabel('Tiempo (s)');
ecgr=ecg+sin(2*pi*60*t)*555.5e-3;
subplot(3,1,2)
plot(t,ecgr)
ylabel('Amplitud mV');
xlabel('Tiempo (s)');
title('ECG + ruido');
grid on
filtro=Num;
h=filtro; %respuesta al impulso del sistema
x=ecgr; %Señal de entrada
%convolucion
hi=h(end:-1:1);
% y=conv(x,h)
l=length(h)+length(x)-1; 
x=[x zeros(1,l)];
hi=[zeros(1,l) hi];
ecgf=zeros(l,1);
j=0;
for i=1:l
%     if i<=length(hi)
            ha=hi(end:-1:length(hi)-j);
            ha=ha(end:-1:1);
            ecgf(i)=x(1:i)*ha';
%             sf(i)=x(1:i)*hi(end:-i:end-j)';
            j=j+1;

%     end
end
t=0:ts:length(ecgf)*ts-ts;
subplot(3,1,3)
plot(t,ecgf)
ylabel('Amplitud mV');
xlabel('Tiempo (s)');
title('ECG filtrada');
xlim([0 max(t)])
grid on



