clear
clc
close all
x=[4 5 7 9 8 ];
h=[1 2];
hi=h(end:-1:1);
y=conv(x,h)
l=length(h)+length(x)-1; 
x=[x zeros(1,l)];
hi=[zeros(1,l) hi];
sf=zeros(l,1);
j=0;
for i=1:l
%     if i<=length(hi)
            ha=hi(end:-1:length(hi)-j);
            ha=ha(end:-1:1);
            sf(i)=x(1:i)*ha';
%             sf(i)=x(1:i)*hi(end:-i:end-j)';
            j=j+1;

%     end
end

sf