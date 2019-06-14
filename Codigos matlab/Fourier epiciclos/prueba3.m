clear
close all
clc

load z.mat;
% Discrete Fourier transform
x=real(z);
y=imag(z);
X = dft(x);
Y = dft(y);
t=0;
h=figure;
xr= zeros(numel(x), 2);
dt = 2 * pi / numel(x);
i=1;
p=0;

while p<2
    cla
    hold on
    x_p=epicycles(0,-125,0*pi,X(:, 1)
    
end

function [px py]=epicycles(x,y,rotation,f,amp,phase,time)

for i=1:length(fourier)
    prevx=x;
    prevy=y;
    freq=f;
    r=amp;
    ph=phase;
    x = x+radius * cos(freq * time + phase + rotation);
    y = y+radius * sin(freq * time + phase + rotation);
    
end
px=x;
py=y;

end

function [X] = dft(x)
% frequency, magnitude, phase
ftrans = fft(x) / numel(x);
X(:, 1) = 0 : numel(x) - 1; %vector de frecuencias
X(:, 2) = abs(ftrans(:, 1)); %vector de amplitudes
X(:, 3) = angle(ftrans(:, 1)); %vector de fases
% Sort on magnitude
X = sortrows(X, 2, 'descend'); %ordenar
end