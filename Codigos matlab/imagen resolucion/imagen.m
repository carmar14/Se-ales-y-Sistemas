img=zeros(15,17,1);
[m n o]=size(img);
img=uint8(img);
%imagen de 8 bits
cuenta=0;
for i=1:m
    for j=1:n
        img(i,j,1)=cuenta;
        cuenta=cuenta+1;
    end
end

imshow(img)


img=zeros(159,104,1);
[m n o]=size(img);
img=uint16(img);
%imagen de 8 bits
cuenta=0;
for i=1:m
    for j=1:n
        img(i,j,1)=cuenta;
        cuenta=cuenta+1;
    end
end

figure
imshow(img)

