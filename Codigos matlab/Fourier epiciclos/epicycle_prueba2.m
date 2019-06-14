clc; clear; close all
% Load signal
load z.mat;
% Discrete Fourier transform
x=real(z);
y=imag(z);
X = dft(x);
Y = dft(y);
% Draw
h = figure();
set(gcf, 'Color', 'w')
set(gcf, 'Position', [10, 50, 750, 600])
x_X_circle_center = 0;
y_X_circle_center = -125;
x_Y_circle_center = 725;
y_Y_circle_center = 100;
inverse_fourier_signal = zeros(numel(x), 2);
% Loop
circle_centers = zeros(numel(x), 2);
radii = zeros(numel(x), 4);
dt = 2 * pi / numel(x);  
t = 0;
i = 1;
periods = 0;
while periods < 2
    if ~ishghandle(h)
        break
    end
    
    cla
    hold on
    
    x_pointer = draw_epicycle(x_X_circle_center, y_X_circle_center, ...
        X, 0*pi, t, circle_centers, radii);
    y_pointer = draw_epicycle(x_Y_circle_center, y_Y_circle_center, ...
        Y, pi/2, t, circle_centers, radii);
    pointer = [x_pointer(1), y_pointer(2)];
    inverse_fourier_signal(i, :) = pointer;
    
    if(periods > 0)
        plot(x + x_X_circle_center, y + y_Y_circle_center, 'r');
    end
    plot(inverse_fourier_signal(1 : i, 1), inverse_fourier_signal(1:i, 2), ...
        'Color', 'b', 'LineWidth', 1.5);    
    plot(pointer(1), pointer(2), 'ko', 'MarkerFaceColor', 'r')
    line([x_pointer(1), pointer(1)], [x_pointer(2), pointer(2)], ...
        'Color', 'k', 'LineStyle', '--');
    line([y_pointer(1), pointer(1)], [y_pointer(2), pointer(2)], ...
        'Color', 'k', 'LineStyle', '--');
    axis equal
    axis([x_X_circle_center - 1.25 * X(1, 2), x_Y_circle_center + 1.25 * Y(1, 2), ...
          y_X_circle_center - 1.25 * X(1, 2), y_Y_circle_center + 1.10 * max(y)]);
    drawnow    
  
    i = i + 1;
    if i > numel(x)
        i = 1;
        inverse_fourier_signal = zeros(numel(x), 2);
        periods = periods + 1;
    end
    
    t = t + dt;
end
function[X] = dft(x)
    % frequency, magnitude, phase
    ftrans = fft(x) / numel(x);
    X(:, 1) = 0 : numel(x) - 1;
    X(:, 2) = abs(ftrans(:, 1));
    X(:, 3) = angle(ftrans(:, 1));
    % Sort on magnitude
    X = sortrows(X, 2, 'descend');
end
function[last_point] = draw_epicycle(x, y, X, offset, t, CIRCLE_CENTERS, RADII)
    % Draw epicycles
    N = min(64, size(X, 1));
    for i = 1 : N
        previous_x = x;
        previous_y = y;
        omega = X(i, 1);
        radius = X(i, 2);
        phi = X(i, 3);
        x = x + radius * cos(omega * t + phi + offset);
        y = y + radius * sin(omega * t + phi + offset); 
        CIRCLE_CENTERS(i, :) = [previous_x, previous_y];
        RADII(i, :) = [previous_x, x, previous_y, y];
    end
    viscircles(CIRCLE_CENTERS(1:N, :), X(1 : N, 2), ...
        'Color', 0.5 * [1, 1, 1], 'LineWidth', 0.1);
    line(RADII(1 : N, 1 : 2), RADII(1 : N, 3 : 4), ...
        'Color', 0.75 * [1, 1, 1]);
    last_point = [x, y];
end