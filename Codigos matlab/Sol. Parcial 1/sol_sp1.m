close all
clc
clear
t=-12:0.001:12;
xt=(-t.^2+1).*(-1<=t& t<=0)+(-1.5*t+1).*(0<t& t<=1)-0.5.*(1<t& t<=2);
subplot(3,1,1)
plot(t,xt)
xlim([-3.5,3.5])
grid on
subplot(3,1,2)
xT=(-(-2*t+1).^2+1).*(-1<=-2*t+1& -2*t+1<=0)+(-1.5*(-2*t+1)+1).*(0<-2*t+1& -2*t+1<=1)-0.5.*(1<-2*t+1& -2*t+1<=2);
plot(t,xT)
xlim([-1.5,1.5])
grid on
subplot(3,1,3)
xTi=(-(2*t+1).^2+1).*(-1<=2*t+1& 2*t+1<=0)+(-1.5*(2*t+1)+1).*(0<2*t+1& 2*t+1<=1)-0.5.*(1<2*t+1& 2*t+1<=2);
plot(t,xTi)
xlim([-1.5,1.5])
grid on
%Grafico de xe
xeT=0.5*(xT+xTi);
figure
subplot(2,1,1)
plot(t,xeT)
xlim([-1.5,1.5])
grid on
subplot(2,1,2)
xoT=0.5*(xT-xTi);
plot(t,xoT)
xlim([-1.5,1.5])
grid on


