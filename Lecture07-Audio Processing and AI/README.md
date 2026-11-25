# Lecture 7 - Audio Processing and AI

## Selected Option
Option C - Analyse an environmental sound.

## Audio File
- Filename: `1-100032-A-0.wav`
- Category: Dog
- Duration: 5 seconds
- Source: ESC-50 (supplied course dataset)

## Settings
| Parameter | Value |
|---|---|
| Sampling frequency | 16000 Hz |
| Window length 1 | 512 samples (32 ms) |
| Window length 2 | 2048 samples (128 ms) |
| Hop length | 160 samples (10 ms) |
| Window type | Hann |

## How to Run
1. Open `analysis.ipynb` in Google Colab.
2. Run the installation cell.
3. Restart the session if required.
4. Run the data-loading cell and upload the supplied ZIP file.
5. Run the common preparation cell.
6. Run Block 1 and Block 2, including Task 1 and Task 2.

## Results

### Waveform and Frequency Spectrum
The waveform shows one short barking sound. The frequency spectrum shows which frequencies are present in the recording.

### Spectrogram Comparison
The window with 512 samples has better time resolution. It is easier to see when the dog barks.
The window with 2048 samples has better frequency resolution. The different frequency components can be seen more clearly.

### Relevant Time Interval and Frequency Region
- Time interval: approximately 2.25 s to 2.55 s
- Strongest frequency region: approximately 700 Hz to 2500 Hz
- Duration of the barking sound: approximately 0.3 s

## Conclusion
The shorter window is better for locating short events in time, while the longer window is better for separating nearby frequencies. The choice of window length depends on what we want to analyse.

## Limitation
It is not possible to improve both time and frequency resolution at the same time by changing the window length alone. A shorter window has poorer frequency resolution, while a longer window has poorer time resolution.

## Use of AI
I used ChatGPT to help me understand the lecture code, adapt it to the assignment and explain my results. I ran the code myself in Google Colab and checked the results.