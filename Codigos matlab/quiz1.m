�lc
clear
close all�Y)M=-5:0.�1:5;
x=-t.*(-1<=t).*(t<=0)+t.*�0<t).*(t<=1)+(1<t).*(t<=2);    �t(t,x)
title('x(t)')
grid    �axis([-5 5 -1�Y)M.5])�Y)Mxi=-(-�).*(-1<=(-t)).*((-t)<=0)+(-    �0<(-t)).*((-t)<=1)+(1<(-t)).*((�t)<=2);
figure
plot(t,xi)
ti�le('x(-t)')
grid on
axis([-5 � -1.5 1.5])

%Calcu�Y)Me la p�rte par
xe=(x+xi)/2;
figure
�lot(t,xe)
title('xe(t)')
grid�on
axis([-5 5 -1.5 1.5])

%C�lculo de la parte)Mmp�Y)Mxo=(x-�i)/2;
figure
plot(t,xo)
    �('xo(t)')
grid on
axis([-5 5 -1.5 1.5])


