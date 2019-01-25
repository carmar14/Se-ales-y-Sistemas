clear
close all
clc
t=0:0.1:4;
x=-exp(-t)+4*exp(-2*t);

%----Uso del comando plot() 
plot(t,x) % Une cada coordenada t,x a traves de una linea
xlabel('Tiempo (s)')
ylabel('x(t)')
title('Grafica de la funcion x(t)=(-e^-t+4e^-2t )u(t)')

y=(sin(t)).^2;
figure()
plot(t,y,':or') %Modificando el estilo de linea(:) y el color de la linea(r=red)
hold on %Sostengo la anterior grafico
plot(t,x,'pb','LineWidth',2.5) %Pentagrama azul con el ancho de linea de 2.5
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Graficas')
legend('x(t)','y(t)')

t1=-5:0.001:5;
y1=t1.^3-15*t1.^2+37*t1+5;
figure()
plot(t1,y1,'LineWidth',1.5)
grid on

%Comando subplot y plot
figure()
subplot(2,2,1)
plot(t,x,'pb','LineWidth',2.5) %Pentagrama azul con el ancho de linea de 2.5
xlabel('Tiempo (s)')
ylabel('Amplitud')
subplot(2,2,2)
plot(t,y,'+b') %Pentagrama azul con el ancho de linea de 2.5
xlabel('Tiempo (s)')
ylabel('Amplitud')
subplot(2,2,3)
plot(t1,y1,'db') %Pentagrama azul con el ancho de linea de 2.5
xlabel('Tiempo (s)')
ylabel('Amplitud')
subplot(2,2,4)
plot(t,y+x,'>') %Pentagrama azul con el ancho de linea de 2.5
xlabel('Tiempo (s)')
ylabel('Amplitud')
figure()
subplot(2,2,1);
x = linspace(-3.8,3.8);
y_cos = cos(x);
plot(x,y_cos);
title('Subplot 1: Cosine')
axis([0 2 0 4]) %Modifico el tamaño del eje x e y para verlo
subplot(2,2,2);
y_poly = 1 - x.^2./2 + x.^4./24;
plot(x,y_poly,'g');
title('Subplot 2: Polynomial')


subplot(2,2,[3,4]);
plot(x,y_cos,'b',x,y_poly,'g');
title('Subplot 3 and 4: Both')

%Usando fplot


%Graficar funcion implicitas y parametricas %Circunferencia
t=linspace(0,2*pi,60);
x=2*cos(t)+4;
y=2*sin(t)+2;
t1=linspace(-2,3,60);
x1=t1.^2-4;
y1=t1/2;
u=x1.^3/3;
v=y1.^2/6;
figure
plot(x,y) %Curva parametrica
grid on
figure
plot(x1,y1)
%quiver(u,v)
grid on

%Funciones polares  Lemnistica de Bernoulli 
theta=linspace(0,2*pi,160);
r=sqrt(4*cos(2*theta));
figure
polar(theta,r)
grid on
title('Lemniscata de Bernoulli')

%Campo vectorial
[x,y]=meshgrid(-1:.08:1);
u=-y;
v=x;
figure()
quiver(x,y,u,v)
hold on
contour(x,y,x.^2+y.^2,10)
axis('square')
title('Campo vectorial F(x,y)=-yi+xj')


%Graficas 3D
%Parametrica
t=0:0.001:10*pi;
x=sin(t);
y=cos(t);
z=t;
figure
plot3(x,y,z)
grid on
axis('square')
title('Helice circular recta')

%Superficies
[x y]=meshgrid(-8.5:0.5:8.5);
z=sin(sqrt(x.^2+y.^2))./sqrt(x.^2+y.^2); 
figure
surf(x,y,z)


[x y]=meshgrid(-2:0.05:2);
z=4*x.^2+y.^2; 
figure
meshc(x,y,z) %Dibuja la superficie y las curvas de nivel
figure
contour3(x,y,z,40)





