import cv2
import os
import glob

#   Hashtag
# =====================================================
hashtag = "selfie"


#   Get All image images
# =====================================================


def getImages(hastag):
    image_dir = hastag
    data_path = os.path.join(image_dir, "*g")
    files = glob.glob(data_path)
    images = []
    images_data = []

    for file in files:
        images.append(file)
        images_data = cv2.imread(file, cv2.IMREAD_COLOR)
        images.append(images)

    return images_data

hashtag = "testing"
images = getImages(hashtag)







