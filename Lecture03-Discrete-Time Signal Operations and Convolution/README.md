# Lecture 03 Assignment: Discrete-Time Signal Operations and Convolution

## 1. Which operation changed the signal amplitude?
The amplitude scaling in Task 1 changed the amplitude of the signal. By multiplying the noisy signal by 2, the amplitude doubled.
The noise was also amplified, while the frequency remained unchanged.

## 2. How did the five-sample delay change the signal?
The delay shifted the signal five samples to the right.
The amplitude and shape of the signal remained unchanged.
The first five samples were set to zero.

## 3. What does the impulse response h[n] represent?
The impulse response h[n] describes how the filter responds to a unit impulse. In our 5-point moving-average filter, it contains five coefficients of 0.2. These coefficients determine how the signal values are weighted to calculate
the average.

## 4. How did convolution change the noisy signal?
The convolution with the moving-average filter reduced the noise and made the signal smoother. In the MATLAB figure, the filtered signal has fewer random fluctuations compared to the noisy signal.
However, the filter also slightly reduced the amplitude of the original signal.

## 5. What differences did you observe between the 5-point and 15-point filters?
The 5-point filter reduced the noise while keeping the original shape of the signal relatively well.
The 15-point filter made the signal even smoother, but it also reduced the amplitude significantly. This can be clearly seen in the MATLAB comparison figure.

## 6. Which filter removed more noise?
The 15-point filter reduced the random fluctuations more strongly because it calculates the average of 15 samples instead of only 5.
This resulted in a much smoother signal, as shown in the MATLAB figure.

## 7. Did the longer filter remove or distort useful signal information?
Yes, the 15-point filter also affected the useful signal information. In the MATLAB figure, the amplitude of the filtered signal is much smaller than the original clean signal.
This happens because the filter averages too many samples and therefore also reduces parts of the original sine wave.

## 8. Which filter would you recommend for this signal? Explain your decision.
I would recommend the 5-point filter for this signal.
It reduces the noise while keeping the original shape and amplitude relatively well. The 15-point filter makes the signal smoother, but it also reduces the amplitude too much.
Therefore, the 5-point filter offers a better balance between noise reduction and preserving the original signal.

## 9. Give one real engineering application for moving-average filtering.
One example is temperature monitoring of an electric motor.
A temperature sensor can produce noisy measurements, even when the actual temperature is relatively stable. A moving-average filter can reduce these fluctuations and provide more stable temperature readings.
However, the filter should not be too long because it could make sudden temperature changes harder to detect.
