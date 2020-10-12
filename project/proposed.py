import os
import glob
import argparse
import numpy as np
import matplotlib.pyplot as plt
import cv2

#   Get All image images
# =====================================================


def getImages(hastag):
    image_dir = hastag
    data_path = os.path.join(image_dir, "*g")
    files = glob.glob(data_path)
    images = []
    images_data = []

    for file in files:
        file = file.replace('\\', '/')
        images.append(file)
        images_data.append(images)

    return images





# The img_estim function will return the
# image type
def img_estim(img, threshold):
    # With kernel size depending upon image size
    blur = cv2.blur(img, (3, 3))
    if cv2.mean(blur)[0] > threshold:
        # The range for a pixel's value in grayscale is (0-255), 127 lies midway
        # (127 - 255) denotes light image
        return "light"
    else:
        # (0 - 127) denotes dark image
        return "dark"


def convertToRGB(image):
    return cv2.cvtColor(image, cv2.COLOR_BGR2RGB)



def gamma_correction(gray_image, alpha = 1.3, beta = 0, gamma = 0.4):
    new_image = np.zeros(gray_image.shape, gray_image.dtype)
    # alpha : simple contrast control
    # beta: simple brightness control

    lookUpTable = np.empty((1, 256), np.uint8)
    for i in range(256):
        lookUpTable[0, i] = np.clip(pow(i / 255.0, gamma) * 255.0, 0, 255)
    result_image = cv2.LUT(gray_image, lookUpTable)
    return result_image



def adjust_gamma(image, gamma=1.0):
	# build a lookup table mapping the pixel values [0, 255] to
	# their adjusted gamma values
	invGamma = 1.0 / gamma
	table = np.array([((i / 255.0) ** invGamma) * 255
		for i in np.arange(0, 256)]).astype("uint8")
	# apply gamma correction using the lookup table
	return cv2.LUT(image, table)





def face_detection(gamma_image, original_image, counter):
    # covert the gamma image to gray

    face_cascade = cv2.CascadeClassifier('data/haarcascades/haarcascade_frontalface_default.xml')
    eye_cascade = cv2.CascadeClassifier('data/haarcascades/haarcascade_eye.xml')

    faces_rects = face_cascade.detectMultiScale(
        gamma_image, 1.3, minSize=(280, 280))

    print('Face found: ', len(faces_rects))


    for (x, y, w, h) in faces_rects:
        cv2.rectangle(original_image, (x, y), (x + w, y + h), (0, 255, 0), 6)
        roi_gray = gamma_image[y:y + h, x:x + w]
        roi_color = original_image[y:y + h, x:x + w]

        eyes = eye_cascade.detectMultiScale(roi_gray)
        #print('Eye found: ', len(eyes))

        # for (ex, ey, ew, eh) in eyes:
        #     cv2.rectangle(roi_color, (ex, ey), (ex + ew, ey + eh), (0, 255, 0), 2)

    if  len(faces_rects) >= 1:
        pass
        # store the image
        cv2.imwrite("D:/opencv/detected_selfie/selfie_" + str(counter) + ".jpg", image)

    return original_image


def converToGray(image):
    return cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)


if __name__ == '__main__':

    #   Fetching photos with Hashtag
    # =====================================================
    hashtag = "testing"
    imageList = getImages(hashtag)
    counter = 0
    
    for image in imageList:
        image_dir = image
        original_image = image
        image = cv2.imread(image)
        gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        image_type = img_estim(gray_image, 50)


        plt.imshow(gray_image, cmap='gray')
        plt.title("Original Image in Grayscale")
        plt.show()


        he_image = cv2.equalizeHist(gray_image)

        # For dark image do something else:
        # Todo: Dark image details will be here.
        plt.imshow(he_image, cmap='gray')
        plt.title("Histogram Equalization")
        plt.show()


        # Reduce image Noice
        # =====================================================
        # apply the 3x3 median filter on the image
        processed_image = cv2.GaussianBlur(he_image, (3, 3), 0)

        plt.imshow(converToGray(convertToRGB(processed_image)), cmap='gray')
        plt.title("3x3 Median Filtered Image")
        plt.show()

        detected_face = face_detection(processed_image, image, counter)
        counter = counter + 1

        plt.imshow(convertToRGB(detected_face))
        plt.title("Face Detected")
        plt.show()