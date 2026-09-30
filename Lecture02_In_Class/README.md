# In Class Assignment Lecture 02:

## Record your results

|Smpling|Nyquist|Observed|Aliasing|
|-------|-------|--------|--------|
| 24kHz | 12kHz |  7kHz  |   No   |
| 16kHz | 8kHz  |  7kHz  |   No   |
| 12kHz | 6kHz  |  5kHz  |   Yes  |
| 8kHz  | 4kHz  |  1kHz  |   Yes  |

## Questions

### 1. Which sampling frequencies represented the 7 kHz signal correctly?
    The 24kHz and tne 16kHz frequencies. because they are over the Nyquist frequencies are above 7kHz. Therfore there is no aliasing.

### 2. When did the 7 kHz signal appear as another frequency?
    24kHz: 12kHz
    16kHz: 8kHz
    12kHz: 6kHz
    8kHz: 4kHz

### 3. What happened when the Nyquist frequency became lower than 7 kHz?
    In this case aliasing is occuring. Than it depends in the sampling frequency what frequency is appearing.

### 4. Did the aliased signal sound different?
    I think there is a difference. But I couldn't hear any difference. 

### 5. Why can MATLAB not recover the original 7 kHz signal after aliasing?
    Thats the case because when the original signal isn't sampled enough, the Information is completely lost and after the Information is lost it can't be recreated.