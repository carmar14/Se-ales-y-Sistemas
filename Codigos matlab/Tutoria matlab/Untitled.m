A=[3 2 -1; 2 0 1; -1 1 2];
b=[1 2 4]';
x=inv(A)*b

x=2:0.001:6;
y=sqrt(4-(x-4).^2)+2;
plot(x,y)
y=-sqrt(4-(x-4).^2)+2;
hold on
plot(x,y)

t=linspace(0,2*pi,160);
r=sqrt(4*cos(2*t));
figure
polar(t,r)
grid on

[x,y]=meshgrid(-1:0.08:1);
u=-y;
v=x;
quiver(x,y,u,v);
hold on
contour(x,y,x.^2+y.^2,10)
axis('square')

close all
num=[1 2 3];
den=[1 17 77 127 66];
f=tf(num,den)
step(f)

ts=5;
tm=ts/10;
fd=c2d(f,tm)
hold on
step(fd)







