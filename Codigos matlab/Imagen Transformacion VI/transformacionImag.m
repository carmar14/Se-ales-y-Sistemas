%Ejemplo de transformacion de la VI  en una imagen
clc
clear
close all
img=imread('ejemplo.jpg');
imshow(img)
title('Imagen original')
set(gca,'Visible','on');

%Desplazar imagen
figure
imgD = imtranslate(img,[-50, -10]);
imshow(imgD)
title('Imagen Desplazada')
set(gca,'Visible','on');

%Escalamiento
figure
imgE=imresize(img,3);
imshow(imgE)
title('Imagen Ampliada')
set(gca,'Visible','on');
figure
imgE=imresize(img,1/3);
imshow(imgE)
title('Imagen Reducida')
set(gca,'Visible','on');

%Reflexion 
figure
imgR=imrotate(img,180); %Horizontal
imshow(imgR)
title('Imagen Reflejada sobre el eje Horizontal')
set(gca,'Visible','on');

%close all

%%Sin comandos de matlab

%Traslacion
[m,n,o]=size(img);
x=50;
y=10;
for i=1:m
    for j=1:n
        pi=i+y;
        pj=j+x;
            if pi>0 & pj>0
                imgd(pi,pj,:)=img(i,j,:);
            end
    end
end

imgd=imgd(1:m,1:n,:);

figure
imshow(imgd)
title('Imagen Desplazada')
set(gca,'Visible','on');

%Otra forma
% iD=uint8(zeros(m,n,o));
% for i=1:m
%     for j=1:n
%        iD(i,j,:)=uint8([1 0 x; 0 1 y;0 0 1]).*img(i,j,:);
%     end
%     
% end
% 
% figure
% imshow(iD)
% title('Imagen Desplazada')
% set(gca,'Visible','on');

%Reflexion sobre el eje vertical y horizontal

[m,n,o]=size(img);

for i=1:m
    for j=0:n-1
    cj=n-j;
    %if cj>0
        imgry1(i,cj,:)=img(i,j+1,:);
        imgry2(i,j+1,:)=img(i,cj,:);
    %end
    if j==350 && i==34
        figure
        imshow(imgry2)
        %pause(0.5)
    end
    end
end

figure
imshow(imgry1)
title('Imagen Reflejada en y1')
set(gca,'Visible','on');

figure
imshow(imgry2)
title('Imagen Reflejada en y2')
set(gca,'Visible','on');

for i=0:m-1
    for j=1:n
    ci=m-i;
    if ci>0
        imgrx(ci,j,:)=img(i+1,j,:);
    end
    end
end

figure
imshow(imgrx)
title('Imagen Reflejada en x')
set(gca,'Visible','on');

%Escalamiento de la imagen
%Disponible en: https://stackoverflow.com/questions/26142288/resize-an-image-with-bilinear-interpolation-without-imresize?noredirect=1&lq=1

%// Get some necessary variables first}
    im=img;
    out_dims=1/3*[m n o];
    in_rows = size(im,1);
    in_cols = size(im,2);
    out_rows = out_dims(1);
    out_cols = out_dims(2);

    %// Let S_R = R / R'        
    S_R = in_rows / out_rows;
    %// Let S_C = C / C'
    S_C = in_cols / out_cols;

    %// Define grid of co-ordinates in our image
    %// Generate (x,y) pairs for each point in our image
    [cf, rf] = meshgrid(1 : out_cols, 1 : out_rows);

    %// Let r_f = r'*S_R for r = 1,...,R'
    %// Let c_f = c'*S_C for c = 1,...,C'
    rf = rf * S_R;
    cf = cf * S_C;

    %// Let r = floor(rf) and c = floor(cf)
    r = floor(rf);
    c = floor(cf);

    %// Any values out of range, cap
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > in_rows - 1) = in_rows - 1;
    c(c > in_cols - 1) = in_cols - 1;

    %// Let delta_R = rf - r and delta_C = cf - c
    delta_R = rf - r;
    delta_C = cf - c;

    %// Final line of algorithm
    %// Get column major indices for each point we wish
    %// to access
    in1_ind = sub2ind([in_rows, in_cols], r, c);
    in2_ind = sub2ind([in_rows, in_cols], r+1,c);
    in3_ind = sub2ind([in_rows, in_cols], r, c+1);
    in4_ind = sub2ind([in_rows, in_cols], r+1, c+1);       

    %// Now interpolate
    %// Go through each channel for the case of colour
    %// Create output image that is the same class as input
    out = zeros(out_rows, out_cols, size(im, 3));
    out = cast(out, class(im));

    for idx = 1 : size(im, 3)
        chan = double(im(:,:,idx)); %// Get i'th channel
        %// Interpolate the channel
        tmp = chan(in1_ind).*(1 - delta_R).*(1 - delta_C) + ...
                       chan(in2_ind).*(delta_R).*(1 - delta_C) + ...
                       chan(in3_ind).*(1 - delta_R).*(delta_C) + ...
                       chan(in4_ind).*(delta_R).*(delta_C);
        out(:,:,idx) = cast(tmp, class(im));
    end
    
    figure 
    imshow(out)
    title('Imagen ampliada')
    set(gca,'Visible','on');
    
%Interpolacion bilineal propia
% factor=1/3;
% sr=m/(factor*m);  %Escalar fila
% sc=n/(factor*n); %Escalar columna
% 
% [cf, rf] = meshgrid(1 : factor*m, 1 : factor*n);
% cf=cf*sc;
% rf=rf*sr;
% 
% r=floor(rf);
% c=floor(cf);
% 
% deltar=uint8(rf-r);
% deltac=uint8(cf-c);



% for i=1:m
%     for j=1:n
%         I(i,j)=img(i,j).*(1-deltar).*(1-deltac);
%     end
%     
% end
% 
% figure
% imshow(I)
                


%Descomposion RGB
imR(:,:,1)=img(:,:,1);
imR(:,:,2)=0;
imR(:,:,3)=0;
imG(:,:,2)=img(:,:,2);
imG(:,:,1)=0;
imG(:,:,3)=0;
imB(:,:,3)=img(:,:,3);
imB(:,:,1)=0;
imB(:,:,2)=0;
figure
subplot(4,1,1)
imshow(imR)
title('Componente R')
set(gca,'Visible','on')
subplot(4,1,2)
imshow(imG)
title('Componente G')
set(gca,'Visible','on')
subplot(4,1,3)
imshow(imB)
title('Componente B')
set(gca,'Visible','on')
subplot(4,1,4)
imshow(imR+imG+imB)
title('Componente RGB')
set(gca,'Visible','on')


