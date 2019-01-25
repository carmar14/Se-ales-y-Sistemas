
%Sebastian Jimenez Blel-2137620

clear 
clc

pause on
x=[0.5 2]; 
m=length(x); 

h=[1 1 1];   
n=length(h);

hi=h(end:-1:1);

k=10;

X=[x,zeros(1,20-m)]; 
X= X([ end-k+1:end 1:end-k ]); 
H=[h,zeros(1,20-n)]; 
H= H([ end-k+1:end 1:end-k ]); 

xn=-10:10-1; 
Y=zeros(1,20);
p=zeros(1,20);

h1=subplot(3,1,1); 
stem(xn,X,'MarkerFaceColor','green'), xlabel('n'), ylabel('x[n]'); 

h2=subplot(3,1,2); 
stem(xn,H,'MarkerFaceColor','b'), xlabel('n'), ylabel('h[n]'); 

pause(3) 

h3=subplot(3,1,3); 
stem(xn,Y,'MarkerFaceColor','red'), xlabel('n'), ylabel('y[n]'); 

H=[hi,zeros(1,20-n)]; 

for i=1:20-n 
    p=X.*H; 
    Y(i+n-1)=sum(p); 
    
    subplot(3,1,2); 
    stem(xn,H,'MarkerFaceColor','b'), xlabel('n'), ylabel('h[n]'); 
    
    subplot(3,1,3)
    stem(xn,Y,'r','MarkerFaceColor','r'), xlabel('n'), ylabel('y[n]'); 
    ylim([0 3]);
    H= H([ end 1:end-1 ]); 
    
    pause(0.5) 
end

pause off

salida=Y(Y>0); 
[salida']