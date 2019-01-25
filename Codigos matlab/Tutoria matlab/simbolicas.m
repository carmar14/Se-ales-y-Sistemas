clc
clear 
close all
syms x y
f=tan(4*x);
fp=diff(f)
g=sin(x)+cos(y);
fpx=diff(g,x)
fpy=diff(g,y)