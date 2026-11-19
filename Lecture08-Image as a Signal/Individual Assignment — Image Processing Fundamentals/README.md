# Option C – Compare edge detectors

## Objective

How does adding noise change the edges that Sobel and Canny detect in cameraman.tif?

## Image and settings

I use the grayscale MATLAB sample image cameraman.tif and one noisy copy. The Gaussian noise has mean 0 and variance 0.01. I use rng(42) so each method receives the same noisy image on every run.

| Method | Settings for both images |
|---|---|
| Sobel | Gaussian smoothing with sigma 1 pixel, then Sobel |
| Canny 1 | Canny with sigma 1 pixel |
| Canny 3 | Canny with sigma 3 pixels |

## Main conclusion and limitation

Smoothing makes the detector less sensitive to small changes in brightness. Stronger smoothing can also remove thin object edges. I check the upper-left sky by comparing the same patch before and after adding noise. A false sky edge and a real tripod edge both increase the total, so the number of edge pixels alone cannot measure accuracy.
