import cv2
import numpy as np
import numpy.fft as fp
import matplotlib.pyplot as plt
import math


img = cv2.imread('moonlanding.png')
img = img[:,:,2]

def to_frequency_domain(image):
    dft = cv2.dft(np.float32(image),flags = cv2.DFT_COMPLEX_OUTPUT)
    dft_shift = np.fft.fftshift(dft)
    return dft_shift



def shift_to_centered_spectrum(frequency_domain):
    magnitude_spectrum = cv2.magnitude(frequency_domain[:,:,0],frequency_domain[:,:,1])
    centered_spectrum = 20*np.log(magnitude_spectrum)
    return (magnitude_spectrum), centered_spectrum


def to_spatial_domain(frequency_domain):
    f_ishift = np.fft.ifftshift(frequency_domain)
    img_back = cv2.idft(f_ishift)
    img_back = cv2.magnitude(img_back[:,:,0],img_back[:,:,1])
    return img_back


fs, center_spectrum = shift_to_centered_spectrum(to_frequency_domain(img))
f_img = 255 * center_spectrum / np.max(center_spectrum)
f_img = f_img.astype(np.uint8)
np.max(f_img), int(np.max(fs))

print(np.max(f_img))