# Lecture 6 - Short evaluation

The recording contained an added 50 Hz noise. The second-order Butterworth IIR band-stop filter from 49 to 51 Hz were applied with `filtfilt`. The spectrogram after filtering shows that the 50 Hz component was strongly reduced. The filter can also weaken useful bass or other signal components between 49 and 51 Hz.