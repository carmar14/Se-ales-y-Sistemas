clc
clear 
close all

[y Fs]=audioread('piano.wav');

figure 
spectrogram(y,[],[],[],Fs,'yaxis'); %Espectograma de señal filtrada