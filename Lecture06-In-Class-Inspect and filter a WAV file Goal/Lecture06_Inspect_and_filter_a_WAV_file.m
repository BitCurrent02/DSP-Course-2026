%% Lecture 6 - Inspect and filter a WAV file
clear; close all; clc;

% Use the folder containing this script (portable for Moodle/GitHub)
scriptFolder = fileparts(mfilename('fullpath'));
fileName = fullfile(scriptFolder,'recording.wav');
figureFile = fullfile(scriptFolder,'lecture6_spectrogram_comparison.png');

% Create the test file if recording.wav is missing
if ~isfile(fileName)
    try
        load handel.mat y Fs
        y = y(:);
        t = (0:length(y)-1)'/Fs;
        x = 0.65*y/max(abs(y)) + 0.2*sin(2*pi*50*t);
        audiowrite(fileName,x,Fs);
    catch
        error('Place recording.wav in the MATLAB Current Folder.');
    end
end

% Read and inspect the recording
[x,Fs] = audioread(fileName);
N = size(x,1);
duration = N/Fs;
channels = size(x,2);
xMono = mean(x,2);

fprintf('Sampling frequency: %d Hz\n',Fs);
fprintf('Duration: %.3f s\n',duration);
fprintf('Channels: %d\n',channels);

% Lecture 6, slide 22
[b,a] = butter(2,[49 51]/(Fs/2),'stop');
yFiltered = filtfilt(b,a,x);
yFilteredMono = mean(yFiltered,2);

% Numerical 50 Hz comparison
n = (0:N-1)';
ref50 = exp(-1j*2*pi*50*n/Fs);
A50before = 2/N*abs(sum(xMono.*ref50));
A50after = 2/N*abs(sum(yFilteredMono.*ref50));
attenuation = 20*log10(A50before/max(A50after,eps));

fprintf('50 Hz amplitude before: %.9f\n',A50before);
fprintf('50 Hz amplitude after:  %.9f\n',A50after);
fprintf('50 Hz attenuation:      %.3f dB\n',attenuation);

% Spectrogram before and after filtering
figure('Color','w','Position',[100 100 1100 450]);

ax1 = subplot(1,2,1);
spectrogram(xMono,4096,3072,8192,Fs,'yaxis');
title('Spectrogram before filtering');
ylim([0 1]);

ax2 = subplot(1,2,2);
spectrogram(yFilteredMono,4096,3072,8192,Fs,'yaxis');
title('Spectrogram after filtering');
ylim([0 1]);

% Identical colour scale for both spectrograms
c1 = clim(ax1);
c2 = clim(ax2);
sameClim = [min(c1(1),c2(1)) max(c1(2),c2(2))];
clim(ax1,sameClim);
clim(ax2,sameClim);
set([ax1 ax2],'Color','w','XColor','k','YColor','k');
set(findall(gcf,'Type','text'),'Color','k');
set(findall(gcf,'Type','ColorBar'),'Color','k');

exportgraphics(gcf,figureFile,'Resolution',300);

% Play both signals with the same playback factor
playbackFactor = 0.9/max([abs(x(:));abs(yFiltered(:))]);
if usejava('desktop')
    sound(playbackFactor*x,Fs);
    pause(duration + 0.5);
    sound(playbackFactor*yFiltered,Fs);
end
