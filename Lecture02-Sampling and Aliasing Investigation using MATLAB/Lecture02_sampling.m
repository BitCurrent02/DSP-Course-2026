%% Task 1: Create the original signal
clear;
clc;
close all;

% Signal parameters
f = 10;           % Signal frequency in Hz
A = 1;            % Dimensionless amplitude
duration = 1;     % Signal duration in s

% Fine time grid for the reference signal
dt = 0.001;              % Time step in s
t = 0:dt:duration;

% Generate the sine wave
x = A * sin(2*pi*f*t);

% Plot the original signal
figure;
plot(t, x, 'b', 'LineWidth', 1.5);

title('Original Signal: 10 Hz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original signal');
grid on;
xlim([0 duration]);

% Save the figure
saveas(gcf, 'original_signal.png');

%% Task 2: Compare five sampling frequencies

sampling_frequencies = [15 20 25 50 100];   % In Hz

figure;

for k = 1:5

    % Select sampling frequency
    fs = sampling_frequencies(k);
    
    % Calculate sampling times and signal values
    t_sample = 0:1/fs:duration;
    x_sample = A * sin(2*pi*f*t_sample);

    % Select subplot
    subplot(5, 1, k);

    % Plot original signal and samples
    plot(t, x, 'b', 'LineWidth', 1.2);
    hold on;
    stem(t_sample, x_sample, 'r', 'filled', 'MarkerSize', 3.5);
    hold off;

    title(['Sampling frequency: ' num2str(fs) ' Hz']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    legend('Original signal', 'Samples');
    grid on;
    xlim([0 duration]);
    ylim([-1.2 1.2]);

end

% Save the complete figure with all five subplots
saveas(gcf, 'sampling_comparison.png');