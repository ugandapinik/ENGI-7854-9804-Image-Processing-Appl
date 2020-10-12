import cv2 as cv
import numpy as np
import argparse
import matplotlib.pyplot as plt


# Read image given user
image = cv.imread('dark_selfie.jpg')
if  image is None:
    print('Could not open or find the image: ', image)
    exit(0)

new_image = np.zeros(image.shape, image.dtype)

# alpha : simple contrast control
alpha = 1.3
# beta: simple brightness control
beta = 0



# for y in range(image.shape[0]):
#     for x in range(image.shape[1]):
#         for c in range(image.shape[2]):
#             new_image[y,x,c] = np.clip(alpha * image[y,x,c] + beta, 0, 255)
#
# cv.imshow('Original Image', image)
# cv.imshow('New Image', new_image)


gamma = 0.4
lookUpTable = np.empty((1,256), np.uint8)
for i in range(256):
    lookUpTable[0,i] = np.clip(pow(i / 255.0, gamma) * 255.0, 0, 255)
res = cv.LUT(image, lookUpTable)

plt.imshow(res)
plt.show()