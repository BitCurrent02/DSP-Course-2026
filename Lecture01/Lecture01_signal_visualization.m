%% Assignment 01 - Signal Visualization with MATLAB

clear;
close all;
clc;

%% General settings

fs = 1000;              % Sampling frequency [Hz]
t = 0:1/fs:1;           % Time vector from 0 s to 1 s


%% Task 1 - Create a 5 Hz sine wave

f0 = 5;                 % Frequency [Hz]
A = 1;                  % Amplitude

x5 = A * sin(2*pi*f0*t);

figure('Name', '5 Hz Sine Wave');

plot(t, x5, 'LineWidth', 1.5);
grid on;

title('5 Hz Sine Wave');
xlabel('Time [s]');
ylabel('Amplitude');


%% Task 2 - Compare different frequencies

freqs = [2 5 10];

fig1 = figure('Name', 'Frequency Comparison');

for k = 1:numel(freqs)

    x = sin(2*pi*freqs(k)*t);

    subplot(3,1,k);

    plot(t, x, 'LineWidth', 1.5);
    grid on;

    ylim([-1.2 1.2]);

    title(sprintf('Sine Wave: %d Hz', freqs(k)));
    xlabel('Time [s]');
    ylabel('Amplitude');

end

exportgraphics(fig1, ...
    'frequency_comparison.png', ...
    'Resolution', 300);


%% Task 3 - Compare different amplitudes

amps = [0.5 1 2];

fig2 = figure('Name', 'Amplitude Comparison');

for k = 1:numel(amps)

    x = amps(k) * sin(2*pi*f0*t);

    subplot(3,1,k);

    plot(t, x, 'LineWidth', 1.5);
    grid on;

    ylim([-2.2 2.2]);

    title(sprintf( ...
        'Amplitude = %.1f, Frequency = %d Hz', ...
        amps(k), f0));

    xlabel('Time [s]');
    ylabel('Amplitude');

end

exportgraphics(fig2, ...
    'amplitude_comparison.png', ...
    'Resolution', 300);


%% Task 4 - Add noise

noiseLevel = 0.3;

noise = noiseLevel * randn(size(x5));

noisyX = x5 + noise;

fig3 = figure('Name', 'Clean and Noisy Signal');

subplot(2,1,1);

plot(t, x5, 'LineWidth', 1.5);
grid on;

title('Clean 5 Hz Sine Wave');
xlabel('Time [s]');
ylabel('Amplitude');


subplot(2,1,2);

plot(t, noisyX);
grid on;

title('5 Hz Sine Wave with Noise');
xlabel('Time [s]');
ylabel('Amplitude');


exportgraphics(fig3, ...
    'clean_vs_noisy_signal.png', ...
    'Resolution', 300);