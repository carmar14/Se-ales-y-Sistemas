function [ env,Tt ] = ADSR( At,Dt,Da,St,Rt,fs)
%ADSR Summary of this function goes here
%   Detailed explanation goes here
% calcula la envolvente ADSR dado:
% At= tiempo de ataque al valor 1 en ms 
% Dt= tiempo de decaimiento al valor Da en ms
% Da= amplitud del decaimiento [0 1]
% St= tiempo de sustain en el valor Da  en ms
% Rt= tiempo de release al valor 0  en ms
% fs= frec de muestreo
% todo a muestras
At=At*fs/1000;
Dt=Dt*fs/1000;
St=St*fs/1000;
Rt=Rt*fs/1000;
Tt=At+Dt+St+Rt;
% armando envolvente
env1=linspace(0,1,At);
env2=linspace(1,Da,Dt);
env3=Da*ones(St,1)';
env4=linspace(Da,0,Rt);
env=[env1 env2 env3 env4];



end

