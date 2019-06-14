clear
close all
clc

%Cargar la imagen y binarizar
img=imread('220px-Pi-CM.svg.png');
img=imread('batman.jpg');

% figure
% imshow(img)

imgb=imbinarize(imrotate(img,180));
% imgb=imbinarize(img);

% [B,L] = bwboundaries(imgb,'noholes');
%
%  hold on
%  for k = 1:length(B)
%         bordes = B{k};
%         plot(bordes(:,2), bordes(:,1), 'b', 'LineWidth', 2)
%  end

% figure
% imshow(img)
% figure

imgc=contour(imgb);
cx=imgc(1,:);
cy=imgc(2,:);
% cx=bordes(:,2);
% cy=bordes(:,1);

close all
% figure
%  plot(cx,cy,'*')
% figure
% imshow(img)
% title('Imagen original')

%%Transofrmada de Fourier
o=1;
for k=1:length(cx)
    if (cy(k)>50 && cy(k)<250)
        z(o)=cx(k)+i*cy(k);%cx(1:100:end)+i*cy(1:100:end);
        o=o+1;
    end
end
z=z(1:50:end);

plot(z,'*')
fx=fftshift(fft(real(z)));
fy = fftshift(fft(imag(z)));
l = length(fx);
%%Magnitud del espectro
nx = abs(fx)/l;  %%Normalizamos la fft
ny = abs(fy)/l;
phase_y = atan2(imag(fy), real(fy));
phase_x=atan2(imag(fx), real(fx));

pts=[];
P=50;
figure
% c=[];
for t = [0:P]
    c=0+0*i;
    plot(z, '*k')
    set(gca,'XLim',[-300 300], 'YLim',[-300 300]);
    hold on;
    % plot cada circulo
    
    for j = 1:l
        r = nx(j);
        rx = nx(j);
        ry = ny(j);
        ph_x = phase_x(j);
        ph_y=  phase_y(j);
        %         j
        circle(real(c), imag(c), rx);
        circle(real(c), imag(c), ry);
        %         offset = fx(j)/l .* exp(i * 2 * pi * (j - ceil(l/2) - mod(l+1,2) ) * (t/P));
        
        %         offset = r .* exp(i * ( 2 * pi * (j - ceil(l/2)) * (t/P) + ph_x));
        %         next_center = c + offset;
        
        offset = rx .* exp(i * ( 2 * pi * (j - ceil(l/2)) * (t/P) + ph_x));
        next_centerx = c + offset;
        
        offset = ry .* exp(i * ( 2 * pi * (j - ceil(l/2)) * (t/P) + ph_y));
        next_centery = c + offset;
        
        % plot the radius
        %         plot([real(c), real(next_center)], [imag(c), imag(next_center)], 'k');
        plot([real(c), real(next_centerx)], [imag(c), imag(next_centery)], 'k');
        c = real(next_centerx)+ imag(next_centery);
        %         j
    end
    %     t
    pts = [pts c];
    plot(pts, 'r');
    drawnow;
    %     pause(1/30);
    hold off;
end

% figure
% plot(pts)

% %Reconstruccion
% xr=ifftshift(fx);
% plot(xr)


