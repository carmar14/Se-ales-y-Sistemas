clc; clear; close all
% Load signal
load z.mat;

figure
plot(z,'*r')
% hold on

Z=fftshift(fft(z));
m=150;
n=length(z);
t=0:0.01:2*pi;
Z=[];
% o=1;
for k=1:n  %vector de informacion de la imagen
    o=1;
    for p=-m:m
        %     zr(o,:)=Z(o)*exp(j*2*pi*k*t/n);
        Z(k,o)=z(k)*exp(-j*2*pi*k*p/n);
        o=o+1;
        
    end
    %     k
end

% Z=fftshift(fft(z));
% Z=sum(Z)/n; %ok
Z=sum(Z)/n;

zr=[];
for i=1:2*m+1
    %     o=1;
    zr(i,:)=Z(i)*exp(j*(i-m-1)*t); %ok
    %     for p=-m:m
    %         zr(i,o)=Z(i)*exp(j*2*pi*i*p/n);
    %         o=o+1;
    %     end
end

zr=sum(zr);
plot(zr)

%Epicirculos
% r=abs(Z);
% for i=1:2*m+1
% viscircles(centers,radii)
% end