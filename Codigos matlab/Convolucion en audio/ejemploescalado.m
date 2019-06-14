clear 
close all
clc
[s, Fs] = audioread('uno.wav');
[m n]=size(s);
if n==2
    s=s(:,1);  %Si es estereo lo convierto en mono
end
Ts=1/Fs;
tiempo =0:Ts:length(s)*Ts-Ts;
plot(tiempo,s)
title('Original')
%sound(s,Fs);
%pause(6)

%Escalamiento
a=3;
te=tiempo(1:a:end)/a;
se=s(1:a:end);
figure
plot(te,se)
title('Escalado')
%sound(se,Fs);


