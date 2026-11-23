%% Lab 6: Mini Project – Your Image Pipeline
close all; clear; clc;

% 1) Load your own image (object, face, landscape, etc.)
I = im2double(rgb2gray(imread('images.jpg')));

% 2) Pre-process: noise removal
I_filt = medfilt2(I,[3 3]);

% 3) Enhance contrast
I_enh = imadjust(I_filt,stretchlim(I_filt),[]);

% 4) Extract features (edges or frequency)
edges = edge(I_enh,'Canny',[0.1 0.25]);

% 5) Optional frequency-domain mask
F = fftshift(fft2(I_enh));
[M,N]=size(F);
[u,v]=meshgrid(-N/2:N/2-1,-M/2:M/2-1);
H = double(sqrt(u.^2+v.^2)<60);
I_lp = real(ifft2(ifftshift(F.*H)));

% 6) Visualization
figure; montage({I, I_filt, I_enh, edges, I_lp},'Size',[1 5]);
title('Original | Denoised | Enhanced | Edges | LP result');

%% 7) Report
% - Describe your processing pipeline.
%First, I loaded a dark image and converted it into grayscale. Then, I used a median filter to reduce noise. After that, I improved the contrast to make more details visible. Next, I used Canny edge detection to find edges. Finally, I applied a low-pass filter and compared all five images.
% - Explain how each stage relates to DSP operations.
%The image is a 2D signal. The median filter reduces noise, and contrast enhancement changes the pixel intensities. Canny detects edges where the brightness changes strongly. The low-pass filter removes high spatial frequencies and makes the image smoother.
% - Discuss improvements or limitations.
%The contrast enhancement makes the dark image easier to see, but some bright areas lose details. The median filter does not remove all noise, and Canny does not detect every edge. The low-pass filter also removes some useful details.