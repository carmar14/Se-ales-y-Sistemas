clc
clear
close all

t=-5:0.01:5;
x1=1.*(-.5<=t & t<=.5);
x2=1.*(-1.5<=t & t<=1.5);
x1t=1.*(-.5<=t-2.5 & t-2.5<=.5);
x2t=1.*(-1.5<=t-2.5 & t-2.5<=1.5);
x=0.5*x1t+x2t;

plot(t,x)
axis([0 5 0 2.5])
ylabel('x(t)')
xlabel('t')

x1it=1.*(-.5<=-t-2.5 & -t-2.5<=.5);
x2it=1.*(-1.5<=-t-2.5 & -t-2.5<=1.5);
xi=0.5*x1it+x2it;
%parte par
xe=(x+xi)/2;
%Impar
xo=(x-xi)/2;
figure
subplot(1,2,1)
plot(t,xe)
title('Parte Par de x(t)')
subplot(1,2,2)
plot(t,xo)
title('Parte Impar de x(t)')