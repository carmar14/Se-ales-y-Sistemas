close all
clear 
clc
ts=1/(5*10000);
Fs=1/ts;
t=0:ts:0.02;
f1=1500;
f2=1800;
f3=7500;
f4=8700;
f5=10000;
% x5=0.7*sin(2*pi*f5*t);
% x1=0.1*sin(2*pi*f1*t);
% x2=0.5*sin(2*pi*f2*t);
% x3=0.33*sin(2*pi*f3*t);
% x4=0.12*sin(2*pi*f4*t);
l=length(t);
%Modulacion en amplitud  yam=sin(wct)+0.5Am*(sin(wc+wm)*t+sin(wc-wm)*t
%yam=(1+Amcos(wmt))*sin(wct) 
for i=1:l
    if i>=1 && i<=125
        x(i)=sin(2*pi*f5*t(i));  %10000
    elseif i<=125*2
        x(i)=(1+cos(2*pi*f4*t(i))).*sin(2*pi*f5*t(i)); %10000,1300,18700
    elseif i<=125*3
        x(i)=(1+cos(2*pi*f2*t(i))).*sin(2*pi*f4*t(i)); %8700,10500,6900
    elseif i<=125*4
        x(i)=(1+cos(2*pi*f1*t(i))).*sin(2*pi*f3*t(i)); %9000,7500,6000
    elseif i<=125*5
        x(i)=(1+cos(2*pi*f2*t(i))).*sin(2*pi*f5*t(i)); %10000,8200,11800
    elseif i<=125*6
        x(i)=(1+cos(2*pi*f1*t(i))).*sin(2*pi*f2*t(i));  %1800,3300,300
    elseif i<=125*7
        x(i)=(1+cos(2*pi*f3*t(i))).*sin(2*pi*f5*t(i));  %10000,17500,2500
    elseif i<=l
        x(i)=sin(2*pi*f2*t(i));  %1800
        
    end

end

plot(t,x)
save('x')
save('ts')
%plot(t,(1+sin(2*pi*f4*t)).*sin(2*pi*f5*t))

figure 
%spectrogram(x,window,noverlap,nfft)
%spectrogram(x,128,250,260,Fs,'yaxis'); %Espectograma de señal con ruido
spectrogram(x,125,2,250,Fs,'yaxis');
[ ,ps,fc,tc]=spectrogram(x,125,2,250,Fs,'yaxis');
% [s,f,tn,p] = spectrogram(x,125,2,250,Fs);
% [q,nd] = max(10*log10(p));
% ylim([0 20])
% hold on
% for i=1:round(tn(1)*2/ts)
%     fnew(i)=f(nd(1));
% end
% plot(t(1:round(tn(1)*2/ts))*1000,fnew/1000,'r','linewidth',4)
% [s,f,tn,p] = spectrogram(x,125,2,250,Fs,'yaxis');
% [q,nd] = max(10*log10(p));
% hold on
% % figure
% plot3(tn*1000,f(nd)/1000,q,'r','linewidth',4)
% hold off
% view(2)
