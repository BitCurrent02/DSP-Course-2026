fs = 200;
d = 0;  % Replace with the last digit of your student number
f2 = 13.2 + 0.17*d;

T_values = [1 4 1];
plot_titles = {'1 s Recording', '4 s Recording', ...
               '1 s Recording with Zero-Padding'};

figure

for i = 1:length(T_values)
    T = T_values(i);
    t = 0:1/fs:T-1/fs;
    x = 0.8*sin(2*pi*15*t) + 0.4*sin(2*pi*f2*t);

    N = length(x);

    if i == 3
        Y = fft(x, 4*length(x));
    else
        Y = fft(x);
    end

    Nfft = length(Y);
    P2 = abs(Y/N);
    P1 = P2(1:Nfft/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:Nfft/2)/Nfft;

    subplot(3,1,i)
    plot(f, P1, 'o-')
    grid on
    xlim([10 18])
    ylim([0 1])
    xlabel('Frequency (Hz)')
    ylabel('Amplitude')
    title(plot_titles{i})
end
