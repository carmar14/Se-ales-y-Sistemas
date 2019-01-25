% CODIGO PARA AYUDAR A ENTENDER LAS TRANSFORMACIONES DE LA VARIABLE INDEPENDIENTE
%---------------------------------------------------------------
%% *** LECTURA DEL ARCHIVO ORIGINAL ***
clear all; %Limpiar las variables
close all; %Cerrar todas las ventanas

%En versiones nuevas de matlab aparece un warning acerca del uso de wavread
%Si falla en su version de matlab, utilicen audioread.
[sonido1,FS]=audioread('uno.wav');%Leer el sonido wav y obtener información;
%Podria utilizar otro archivo de sonido?

data=sonido1;%asignando el vector sonido1 a la variable data
Fs = FS; %Frecuencia de muestreo
x = data;	%Asiganando data a la variable x (Alguna utilidad?)
N = length(x); %Obtener el largo del vector.


ORIG=x(1:N);
ORIG1=[zeros(N,1);ORIG;zeros(N,1)];
NN=[-N:2*N-1];
subplot(4,1,1), plot(NN,ORIG1),title('Señal Original');
soundsc(ORIG,Fs);
pause
%demostracion de dilatacion
DIL = zeros(2.*length(ORIG),1);
DIL(1:2:2.*length(ORIG)) = ORIG(1:length(ORIG)); %Realmente no coincide exactamente con el 
%fundamento teorico, sabe usted explicar porque?
DIL1=[zeros(N,1);DIL];
subplot(4,1,2), plot(NN,DIL1),title('Señal Dilatada  x(t/2)');
soundsc(DIL,Fs);
pause
%demostracion de compresion
COMP = zeros(round(length(ORIG)/2),1);
COMP= ORIG(1:2:length(ORIG));
COMP1=[zeros(N,1);COMP;zeros(2*N-round(N/2),1)]; %Cual cree que sea la idea de escribir de esta forma el vector?
subplot(4,1,3), plot(NN,COMP1),title('Señal Comprimida x(2t)');
soundsc(COMP,Fs);
pause
%demostracion de reflexion
REF = flipud(ORIG); %y como se haria en caso de no contar con una libreria como flipud? i.e. c++
REF1=[REF;zeros(2*N,1)];
subplot(4,1,4), plot(NN,REF1),title('Señal Reflejada x(-t)');
soundsc(REF1,Fs);
pause
clear all
close all


%El reto de este fin de semana para ustedes, es realizar estas operaciones  sobre una imagen-
%Añadan tambien la operacion de desplazamiento.
%Recuerden que la variable independiente en el caso de una imagen no es una
%sino 2: las coordenadas X y Y, y la variable dependiente es la intensidad.