clear 
close all
clc

a=zeros(1,4);
d=[1 -1 3 4];
s=zeros(1,4);
l=length(a);
% a(1)=d(1);

for j=1:l
    a(1)=d(j);
    if j<l
        for i=l:-1:2
            a(i)=a(i-1);
    %         a(i+1)
        end
    end
end