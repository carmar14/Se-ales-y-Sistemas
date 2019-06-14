% clear; clc; close('all');
% %%Given
% Q = input('Animate?(0 = no, 1 = yes): '); 
%     % primary orbit
%     R = 5; % radius
%     T1 = 1; % period
%     % epicycle
%     r = 2; % radius
%     tratio = 9.25; % period ratio
%     % time and number of data points
%     Nc = 10; % number of cycles
%     Ntpc = 200; % number of time points per cycle
%     ti = 0; % initial time
% %%Calculations
%     % time and number of data points
%     tf = Nc*T1; % final time
%     Nt = Nc*Ntpc; % total number of data points
%     t = linspace(ti,tf,Nt); % time vector
%     % primary orbit
%     omega1 = (2*pi)/T1; % angular frequency
%     X = R*cos(omega1*t); % x vector
%     Y = R*sin(omega1*t); % y vector
%     % epicycle
%     T2 = T1/tratio; % period 
%     omega2 = (2*pi)/T2; % angular frequency
%     x = R*cos(omega1*t)+r*cos(omega2*t); % x vector
%     y = R*sin(omega1*t)+r*sin(omega2*t); % y vector
% %%Display Results
% doAnimation = logical(Q);
% if doAnimation
%     for k = 1:Nt
%         plot(X,Y); % primary orbit
%         hold('on');
%         plot(x(k),y(k),'or','markerfacecolor',[1 0 0]); % particle
%         plot(x(1:k),y(1:k),'r-','markerfacecolor',[1 0 0]); % trace
%         axis([-(R+r) (R+r) -(R+r) (R+r)]);
%         title('EPICYCLES');
%         xlabel('x');
%         ylabel('y');
%         hold('off');
%         pause(0.1);
%         drawnow;
%     end
% else
%     plot(X,Y); % primary orbit
%     hold('on');
%     plot(x,y,'r-','markerfacecolor',[1 0 0]); % trace
%     axis([-(R+r) (R+r) -(R+r) (R+r)]);
%     title('EPICYCLES');
%     xlabel('x');
%     ylabel('y');
%     hold('off');
% end


clear
close all
clc

x = [-5:5] + 1i;
% x=cx+i*cy;
% x = [-2+2*i, -1+2*i, 2*i, 1+2*i, 2+2*i, 2+i, 2, 2-i, 2-2*i, 1-2*i, -2*i, -1-2*i, -2-2*i, -2-i, -2, -2+i];
% x = 3*[-2+2*i, -1+2*i, 2*i, 1+2*i, 2+2*i, 2+i, 2, 2-i, 2-2*i, 1-2*i, -2*i, -1-2*i, -2-2*i, -2-i, -2, -2+i, -2+2*i];
% x = [0:0.5:5] * (1 + i);
plot(x, 'b')
set(gca,'XLim',[-10 10], 'YLim',[-10 10]);
y = fftshift(fft(x));
n = length(y);
radii = abs(y)/n;
phase_angles = atan2(imag(y), real(y));
points = [];
P = 100;
for t = [0:P]
  curpt = 0 + 0i;
  plot(x, 'g')
  set(gca,'XLim',[-10 10], 'YLim',[-10 10]);
  hold on;
  % plot each circle
  for j = 1:n
    r = radii(j);
    phase_angle = phase_angles(j);
    circle(real(curpt), imag(curpt), r);
%     offset = y(j)/n .* exp(i * 2 * pi * (j - ceil(n/2) - mod(n+1,2) ) * (t/P));
    % this also works
    offset = r .* exp(i * ( 2 * pi * (j - ceil(n/2)) * (t/P) + phase_angle));
    next_center = curpt + offset;
    % plot the radius
    plot([real(curpt), real(next_center)], [imag(curpt), imag(next_center)], 'k');
    curpt = next_center;
  end
  
  points = [points curpt];
  plot(points, 'r');
  drawnow;
  pause(1/30);
  hold off;
  end%for
%plot(points);
%plot(ifft(y), 'g');
hold off