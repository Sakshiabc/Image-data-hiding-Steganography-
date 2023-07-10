# Image-data-hiding-Steganography-
Steganography - Data hiding method using bit plane slicing technique

Conclusion:
An image that has less MSE value is more preferable for transfer of the secret text.
RMSE measures the average magnitude of the error. 
PSNR is usually expressed in terms of the logarithmic decibel scale. 
It is the square of ratio of maximum pixel value i.e. 255 to the MSE value. Images having high PSNR value are preferable.
For a good image the SNR value must be high.
SSIM is used to measure the quality by capturing the similarity of images
based on three comparisons: luminance, contrast and structure which are selected for the measure of imperceptibility.

Result and analysis, SSIM and PSNR
Structural Similarity Index for quantifying image quality degradation
Peak Signal to Noise Ratio is used to measure the quality of reconstruction of lossy and lossless compression

for bit(1,2) ssim=0.9915, psnr=42.6990 ---------->high
for bit(6,7) ssim=0.4271, psnr=13.5034 ---------->low

Therefore it is recommended to hide data in 1st and 2nd bit plane
