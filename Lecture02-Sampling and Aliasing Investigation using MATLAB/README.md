# Lecture 02 - Sampling and Aliasing
## Objective 
I investigated how the sampling frequency affects the representation of the originally 10 Hz sine wave. Regarding that I compared the different samplings and took a look into the Nyquist analysis and the aliasing. 

## Nyquist Analysis
### 1.Which sampling frequencies satisfy the Nyquist criterion?
  f_max = 10 Hz
  f_s >= 2*f_max (from slides)
 => f_s >= 2 * 10 Hz = 20 Hz

 The theoretical mimimum sampling frequency using the Nyquist are 20 Hz, 25 Hz, 50 Hz, and 100 Hz. 15 Hz is below the 20 Hz so it does not satisfy the Nyquist criteria.

### 2.Is sampling exactly at the Nyquist rate recommended in practice? Explain your answer.

My answer is no. That's because equality is a critical case if the phase is unknown. In the results of the task 2 you can see that this is a critical case. You can see that the sampling with 20 Hz the sampling point falls always at the zero crossing. Therefore you should always take f_s > 2 * f_max to avoid these circumstances. 

## Results
15 Hz: The Sampling period is every 0.0667s ; This is Undersampling. It's not enough

20 Hz: The Sampling period is every 0.05s ; You can see that every sample falls on a zero crossing

25 Hz: The Sampling period is every 0.04s ; over the boundary from the Nyquist analysis but it's also sparse.

50 Hz: The Sampling period is every 0.02s ; You can see way better the oscillation of the original 10 Hz sine

100 Hz: The Sampling period is every 0.01s ; You can see the oscillation of the original 10 Hz sine even better, than at 50 Hz.


## Aliasing Discussion

When the sampling rate is below twice the 10 Hz frequence, Aliasing is happening. We can see it here with the 15 Hz sampling. Aliasing is occurring when there are too few samples per period to recreate the original signal. That means that multiple different signals produce identical samples. 
Also is smapling at exactly twice the 10 Hz a critical case because the sampling with 20 Hz every sampling point lays at the zero point. Therefore, you always should choose a higher sampling frequency than double your original frequency. 
Even if at 25 Hz the sampling is still sparse you could recreate the original oscillation. If you take an even higher frequency like 50 Hz or 100 Hz you will be able to see the waveform even clearer.


## Engineering Recommendation

For our 10 Hz signal, I would choose a sampling frequency of 50 Hz. I would chosse the 50 Hz sampling as a compromiss between the detail and date volume of this waveform. 

## AI Usage
### AI Tool used
ChatGPT
### Prompts
"erstelle dafür den Matlab Code und erkläre alles" --asking for the code.
"was ist das gcf darin?" — asking about the figure-saving command.
"oke aber was ist dann der unterschied, ob ich figure benutze oder nicht? relativ kurz antworten aber trd ausreichend erklären" — asking how figure creation works.
"wie kann ich die roten punkte noch etwas kleiner machen? weil gerade beim 100 Hz man es nicht so gut erkennt" — asking to improve the sampling plot.

### Summary of AI Response
ChatGPT generated and explained the MATLAB code for the original signal and the five sampling rates. It suggested a loop with five subplots, explained plotting and saving commands.

### What I Modified
During the interaction, I chose the recommended five-subplot layout and requested smaller red markers because the 100 Hz plot was difficult to read. ChatGPT supplied the corresponding code adjustment using 'MarkerSize', 3

### How I verified the results
I ran the MATLAB script and reviewed if the result are like I thought and expected.

I checked some of the Results against the slides.
Also did I do an crosscheck with the same AI.