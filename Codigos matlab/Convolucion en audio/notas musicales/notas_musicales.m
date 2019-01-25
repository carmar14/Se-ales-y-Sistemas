% Si Si do re re do Si La Sol Sol La Si Si La La
% Si Si do re re do Si La Sol Sol La Si La Sol Sol
% 
% La Si Sol La Si do Si Sol
% La Si do Si La Sol La Re
% 
% Si Si do re re do Si La Sol Sol La Si La Sol Sol

clear
close all
clc

Fs=8000;
tf=3;
t=0:1/Fs:3;
fdo=262.63;
fre=293.66;
fmi=329.63;
ffa=349.23;
fsol=392;
fla=440;
fsi=493.88;

do=exp(-t/3).*sin(2*pi*fdo*t);
re=exp(-t/3).*sin(2*pi*fre*t);
mi=exp(-t/3).*sin(2*pi*fmi*t);
fa=exp(-t/3).*sin(2*pi*ffa*t);
sol=exp(-t/3).*sin(2*pi*fsol*t);
la=exp(-t/3).*sin(2*pi*fla*t);
si=exp(-t/3).*sin(2*pi*fsi*t);

% sound(do,Fs)
% pause(3)
% sound(re,Fs)
% pause(3)
% sound(mi,Fs)
% pause(3)
% sound(fa,Fs)
% pause(3)
% sound(sol,Fs)
% pause(3)
% sound(la,Fs)
% pause(3)
% sound(si,Fs)
% pause(3)


cancion=[si si do re re do si la sol sol la si si la la si si do re re do si la sol sol la si la sol sol la si sol la si do si sol la si do si la sol la re si si do re re do si la sol sol la si la sol sol];
tiempo=0:1/Fs:3*61;
plot(tiempo,cancion)
%pause(2)
%sound(cancion,Fs)