import numpy as np
import cv2
import matplotlib.pyplot as plt

# Loading the image to be tested
test_image = cv2.imread('./baby.jpg')

# cverting to grayscale
test_image_gray = cv2.cvtColor(test_image, cv2.COLOR_BGR2GRAY)

# displaying the grayscale image
plt.imshow(test_image_gray, cmap='gray')
plt.show()

# since we know that OpenCV loads an image in BGR format
# Lets create a function to change it

def convertToRGB(image):
    return cv2.cvtColor(image, cv2.COLOR_BGR2RGB)


haar_cascade_face = cv2.CascadeClassifier('data/haarcascades/haarcascade_frontalface_default.xml')
faces_rects = haar_cascade_face.detectMultiScale(test_image_gray, scaleFactor = 5, minNeighbors = 5)

# lets us print the no. of faces found
print('Face found: ', len(faces_rects))

for (x, y, w, h) in faces_rects:
    cv2.rectangle(test_image, (x, y), (x + w, y + h), (0, 255, 0), 2)


#convert the image to RGB and show image
plt.imshow(convertToRGB(test_image))
plt.show()