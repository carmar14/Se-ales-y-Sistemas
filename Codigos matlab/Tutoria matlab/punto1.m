clc
clear 
close all

%Punto 1
%Creacion de vector usando corchetes
%---------Primera forma-------Usando [] 
a=[2 4 5 7 8] %Vector fila
b=[1 ;4; -1; 5.5;9];%Vector columna
%--------Sin uar []
ao=-3:0.01:3;
%------------Creacion usando for
c=[];
cont=1;
for i=-3:0.01:3
    
    if i>=0
        c(cont)=i+5;
    else
        c(cont)=i;
    end
    cont=1+cont;
end

%--------------Creacion usando linspace
d=linspace(-3,3-100);

%---------------Generar matriz
m2=[-4 5; 2 6];
m3=[3 2 1
    4 6 7
    9 0 2];


%--------------Extraer informacion
o=ones(4,2);  %Matriz 4x2 de unos
c0=zeros(5);  %Matriz 5x5 de ceros
i=eye(4); %Matriz identidad
m=randn(5,3); %Creacion de una matriz de 5 filas y 3 columnas con distribucion uniforme
d=diag(m);   %Obtengo diagonal de m
n=rand(4); %Creacion de una matriz cuadrada de 4x4 entre 0-1
d1=diag(n);
d2=diag(n,2); %Obtengo diagonal por encima de la diagonal principal
d3=diag(n,-1); %Obtengo diagonal por debajo de la diagonal principal
d4=diag(diag(n)); %Matriz conformada por la diagonal principal de n
ma=m(1,:); %Obtener fila 1 de la matriz m
mb=m(:,3);%Obtener columna 3 de la matriz m
m=randn(5);
mc=m(2:4,2:3); %Obtener una submatriz de m

% Operaciones entre matrices
A=[1 2; 3 5];
B=[4 5;-1 4];
suma=A+B;
resta=A-B;
pm=A*B;  %Multiplicacion matricial [a*e+g*b a*f+b*h; c*e+d*g; c*f+d*h]
pm1=rand(3,2)*rand(2,4);
pp=A.*B; %Mutilplicacion elemento a elemento
pp=A.*[2 2]; %Mutilplicacion elemento a elemento
a=[2 0 1];
b=[1 -1 3];
pp=a*b'; %Producto punto entre dos vectores
px=cross(a,b); %Producto cruz entre dos vectores
A=rand(3);
at=A'; %Traspuesta de una matriz
A=[2 1; 4 5]
ad=det(A); % Determinante de una matriz
ai2=[A(2,2) -A(1,2); -A(2,1) A(1,1)]/det(A);
ai=inv(A); %Inversa de una matriz 2x2 matriz adj(A)/det(A), A tiene que ser cuadrada.

