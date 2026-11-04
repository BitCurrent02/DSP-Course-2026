Fs = 1000;

t = (0:1/Fs:2-1/Fs)';

rng(7);

clean = sin(2*pi*5*t) + 0.35*sin(2*pi*12*t);

noise = 0.35*sin(2*pi*50*t) + 0.20*sin(2*pi*137*t) ...
        + 0.25*randn(size(t));

x = clean + noise;

fc = 20;

bFIR = fir1(60, fc/(Fs/2), 'low');

[bIIR,aIIR] = butter(4, fc/(Fs/2), 'low');

yFIR = filtfilt(bFIR,1,x);

yIIR = filtfilt(bIIR,aIIR,x);

idx = t < 0.2;

figure;
plot(t(idx), clean(idx), 'm--', ...
    t(idx), x(idx), 'r', ...
    t(idx), yFIR(idx), 'b', ...
    t(idx), yIIR(idx), 'g');

grid on;
xlabel('Time (s)');
ylabel('Amplitude (arbitrary units)');
title('Sensor signal comparison');
legend('Clean', 'Noisy', 'FIR output', 'IIR output');


[HFIR,f] = freqz(bFIR,1,8192,Fs);
[HIIR,~] = freqz(bIIR,aIIR,8192,Fs);

figure;
plot(f,20*log10(max(abs(HFIR),eps)),'b', ...
    f,20*log10(max(abs(HIIR),eps)),'g');

grid on;
xlim([0 160]);
ylim([-100 5]);
xline(fc,'m--','20 Hz cutoff');

xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('FIR and IIR magnitude responses');
legend('FIR','IIR');

N = length(x);

P = abs(fft([x yFIR yIIR]))/N;

P = P(1:N/2+1,:);
P(2:end-1,:) = 2*P(2:end-1,:);

f = (0:N/2)'*Fs/N;

figure;
plot(f,P(:,1),'r', ...
    f,P(:,2),'b', ...
    f,P(:,3),'g');

grid on;
xlim([0 160]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (arbitrary units)');
title('Single-sided sensor amplitude spectra');
legend('Noisy','FIR output','IIR output');


RMSE = [sqrt(mean((x-clean).^2)); ...
    sqrt(mean((yFIR-clean).^2)); ...
    sqrt(mean((yIIR-clean).^2))];

Signal = {'Noisy input'; 'FIR output'; 'IIR output'};

disp(table(Signal,RMSE));


load handel

xClean = y(:);

tAudio = (0:numel(xClean)-1)'/Fs;

xHum = xClean + 0.15*sin(2*pi*50*tAudio);

[bN,aN] = butter(2, [49 51]/(Fs/2), 'stop');

yAudio = filtfilt(bN,aN,xHum);


idxAudio = tAudio >= 1 & tAudio <= 1.1;

figure;
plot(tAudio(idxAudio),xClean(idxAudio),'m--', ...
    tAudio(idxAudio),xHum(idxAudio),'r', ...
    tAudio(idxAudio),yAudio(idxAudio),'g');

grid on;
xlabel('Time (s)');
ylabel('Amplitude (arbitrary units)');
title('Audio waveform comparison');
legend('Clean','Hum added','Filtered');




NAudio = length(xClean);

PAudio = abs(fft([xClean xHum yAudio]))/NAudio;

PAudio = PAudio(1:floor(NAudio/2)+1,:);
PAudio(2:end,:) = 2*PAudio(2:end,:);

fAudio = (0:floor(NAudio/2))'*Fs/NAudio;

figure;
plot(fAudio,20*log10(max(PAudio(:,1),eps)),'m--', ...
    fAudio,20*log10(max(PAudio(:,2),eps)),'r', ...
    fAudio,20*log10(max(PAudio(:,3),eps)),'g');

grid on;
xlim([35 65]);
xline(50,'m:','50 Hz');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB re 1 unit)');
title('Audio spectra around 50 Hz');
legend('Clean','Hum added','Filtered');


playbackGain = 0.9/max([abs(xHum); abs(yAudio)]);

disp('Playing hum-added audio');
sound(playbackGain*xHum,Fs);
pause(NAudio/Fs + 0.5);

disp('Playing filtered audio');
sound(playbackGain*yAudio,Fs);
pause(NAudio/Fs + 0.5);




ref50 = exp(-1j*2*pi*50*tAudio);

A50before = 2/NAudio*abs(sum(xHum.*ref50));
A50after = 2/NAudio*abs(sum(yAudio.*ref50));

attenuation50 = 20*log10(A50before/max(A50after,eps));

fprintf('50 Hz amplitude before: %.6f\n',A50before);
fprintf('50 Hz amplitude after: %.6f\n',A50after);
fprintf('50 Hz attenuation: %.2f dB\n',attenuation50);



[bWide,aWide] = butter(2, [45 55]/(Fs/2), 'stop');

yWide = filtfilt(bWide,aWide,xHum);

A50wide = 2/NAudio*abs(sum(yWide.*ref50));

attenuationWide = 20*log10(A50before/max(A50wide,eps));

fprintf('Wider filter: 50 Hz amplitude after: %.6f\n',A50wide);
fprintf('Wider filter: 50 Hz attenuation: %.2f dB\n',attenuationWide);