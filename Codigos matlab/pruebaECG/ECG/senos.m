close all
t=0:0.001:0.001*1000;
ys1=1+sin(2*pi*10*t);
ys2=1+sin(2*pi*40*t);
ys3=ys1*250+ys2*100;
plot(t,ys3);
ys4=(1+sin(2*pi*60*t))*100;
ys5=ys4+ys3;
figure
plot(t,ys5);