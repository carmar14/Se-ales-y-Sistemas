
%Punto solucion de ecuaciones 2x2: ax+by=c
%Solucion unica
clear 
close all
clc

% Forma matricial: Ax=B, x-y=2, x+y=3  
%|1 -1| |x|=|2|
%|1  1| |y|=|3|
%Solucion
A=[1 -1; 1 1];
B=[2 3]';
%Primera forma
x=A\B;
%Usando la inversa  x=A-1B
Ai=inv(A);
x2=Ai*B

%Sistema 3x3:
%3x+2y-z=10
%2x+z=2
%-x+y+2z=4
%Forma matricial
%| 3 2 -1||x|=|10|
%| 2 0  1||y|=|2 |
%|-1 1  2||z|=|4 |
A=[ 3 2 -1; 2 0 1; -1 1 2];
B=[10 2 4]';
x=A\B;


