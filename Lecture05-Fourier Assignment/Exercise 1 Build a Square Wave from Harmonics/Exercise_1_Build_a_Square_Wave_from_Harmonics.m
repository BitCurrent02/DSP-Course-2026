t = linspace(-1, 1, 4000);

figure
hold on

for H = [1 3 9 25]
    x = zeros(size(t));

    for k = 1:2:H
        x = x + (4/pi)*sin(2*pi*k*t)/k;
    end

    plot(t, x, 'LineWidth', 1.2, 'DisplayName', sprintf('H = %d', H));
end

grid on
xlabel('Time (s)')
ylabel('Amplitude')
title('Square Wave Approximation')
legend('show')
hold off