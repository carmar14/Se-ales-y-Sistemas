clc
clear 
close all
%punto 1

t=-2:0.001:2;
xt=(-2<t).*(t<-1)+(-1)*(-1<t).*(t<=0)+(t-1).*(0<t).*(t<1)+(1<t).*(t<2);
plot(t,xt)
ylim([-1.2 1.2])
title('x(t)')
%x(-2t+1)
xT=(-2<(-2*t+1)).*((-2*t+1)<-1)+(-1)*(-1<(-2*t+1)).*((-2*t+1)<=0)+((-2*t+1)-1).*(0<(-2*t+1)).*((-2*t+1)<1)+(1<(-2*t+1)).*((-2*t+1)<2);
figure
plot(t,xT)
ylim([-1.2 1.2])
title('x(-2t+1)')
%x(-(-2t+1))
xTi=(-2<(2*t+1)).*((2*t+1)<-1)+(-1)*(-1<(2*t+1)).*((2*t+1)<=0)+((2*t+1)-1).*(0<(2*t+1)).*((2*t+1)<1)+(1<(2*t+1)).*((2*t+1)<2);
figure
plot(t,xTi)
ylim([-1.2 1.2])
title('x((2t+1))')
%Parte par
xe=(xT+xTi)/2;
figure
plot(t,xe)
ylim([-1.2 1.2])
title('xe(t)')

%Parte impar
xo=(xT-xTi)/2;
figure
plot(t,xo)
ylim([-1.2 1.2])
title('xo(t)')

%Punto 2
n=-50:1:50;
xn=exp(i*pi/2)*exp(i*pi/2)*exp(i*pi*n/16);
figure
stem(n,xn)
title('x(n)')
P=sum(abs(xn).^2)/(2*50+1)

%Punto3
a=5;
t=0:0.001:10;
x=exp(-a.*t);
h=1;
y=conv(x,h);
figure
plot(t,y)
% plot(t,(1-exp(-a.*t))/a)
title('y(t)')

%Punto 4(prueba de linealidad)
t=0:0.001:1;
x1=ones(1,length(t));
x2=2*ones(1,length(t));
x3=x1+x2; %Combinacion lineal de x1 y x2
w=2*pi;
%El sistema es y(t)=x(t)*cos(wt)+5
y1=x1.*cos(w*t)+5; %Entrada x1 produce salida y1
y2=x2.*cos(w*t)+5; %Entrada x2 produce salida y2
y3=y1+y2;
y4=x3.*cos(w*t)+5;
figure
plot(t,y3)
hold on
plot(t,y4)

%Punto 5
n=-2:1:4;
x1=[0 0 0 0 2 0 0];
y1=[0 0 0 0 1 2 0];
figure
ax1=subplot(3,2,1)
grid on
stem(n,x1,'LineWidth',2)
title('x1[n]')
ax2=subplot(3,2,2)
stem(n,y1,'LineWidth',2)
title('y1[n]')
x2=[0 1 0 0 0 0 0];
y2=[0 2 1 0 0 0 0];
ax3=subplot(3,2,3)
stem(n,x2,'LineWidth',2)
title('x2[n]','LineWidth',2)
ax4=subplot(3,2,4)
stem(n,y2,'LineWidth',2)
title('y2[n]')
x3=[0 0 0 1 2 0 0];
y3=[0 0 0 2 3 1 0];
ax5=subplot(3,2,5)
stem(n,x3,'LineWidth',2)
title('x3[n]')
ax6=subplot(3,2,6)
stem(n,y3,'LineWidth',2)
title('y3[n]')
grid(ax1,'on')
grid(ax1,'minor')
grid(ax2,'on')
grid(ax2,'minor')
grid(ax3,'on')
grid(ax3,'minor')
grid(ax4,'on')
grid(ax4,'minor')
grid(ax5,'on')
grid(ax5,'minor')
grid(ax6,'on')
grid(ax6,'minor')

y3n=y1+[0 0 0 2 1 0 0]; %y3(n)=y1(n)+y2(n-2)  %Prueba de linealidad
figure
stem(n,y3n)
title('y3(n)=y1(n)+y2(n-2)')

