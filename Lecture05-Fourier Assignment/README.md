# Lecture 5 - Fourier Assignment (MATLAB exercises on Fourier Series, DTFT and DFT)
## Exercise 1: Build a Square Wave from Harmonics
### Prediction:
My prediction is that as I use more and more harmonics, it will look more like a square wave signal.
### Result:
I can see that as I increase H the waveform is transforming to square wave as expected. I can see that the flat parts became even clearer and also it becomes steeper. But I can also see that at the transition it goes over +1 and under -1.
## Exercise 2:  Find Two Frequencies with the FFT
### Prediction:
x_1 = 0.8*sin(2*pi*15*t) => f = 15Hz; A = 0.8
x_2 = 0.4*sin(2*pi*40*t) => f = 40Hz; A = 0.4
### bin spacing
frequency was 200 Hz; recording was 1s
N = 200 Hz * 1s = 200 samples
frequency bin-spacing:
deltaf = f_s/ N = 200 Hz/ 200 = 1Hz

## Exercise 3:  Investigate Spectral Leakage
I took the 0 because to be honest I really don't know where I can see my student number :). I looked at my student ID card but couldn't find it.
### Prediction:
the peak will be over two bins.
### 1 s and 4 s Recordings
In the plot from 1s, the peak spread across neighbouring bins. In the 4s plot, the peaks were more narrower. The bin spacing changed from about 200 Hz / 200 = 1 Hz to 200 Hz / 800 = 0.25 Hz.
### Zero-Padding
Zero-padding the 1s recording also gave a bin-spacing of 0.25 Hz. The plot looked more smoother, and the recording still had the 200 signal samples.

## Exercise 4:  Compare the DTFT and DFT
### Compare the smooth DTFT curve with the DFT values.
The values of DFT lies on the curve of th DTFT. It shows the four points on the curve at the 4 point DFT. At the 64 DFT shows more of the clearly shape. Thats because the points are closer.
### Explain why fft(x,64) produces more frequency points than fft(x,4). Does it add new samples to the original sequence?
ft(x,64) adds 60 zeros before calculating the FFT, so it gives 64 frequency points. No, the original sequence still has four signal samples.
### From the DTFT plot, identify where the magnitude becomes zero.
In the plot: The DTFT magnitude is zero at −π, −π/2, π/2 and π.